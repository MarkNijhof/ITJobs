
(function($){

	$.fn.loadTemplateFromUrl = function(templateUrl, templateData, callBack){
    var $this = this;
    var html;
    $.templateLoader.loadFromUrl(templateUrl, function(template){
      if (templateData){
        $.templateLoader.parseTemplate(template, templateData, function(parsedTemplate){
          template = parsedTemplate;
        });
      }
      html = template;
    });

    $.templateLoader.appendAndCallBack($this, html, callBack);
    return this;
  };

  $.fn.loadTemplateFromStr = function(templateStr, templateData, callBack){
    var $this = this;
    if (templateData){
      $.templateLoader.parseTemplate(templateStr, templateData, function(parsedTemplate){
        templateStr = parsedTemplate;
      });
    }

    $.templateLoader.appendAndCallBack($this, templateStr, callBack);
    return this;
  };
  
  var TemplateLoader = function(){

    this._templateCache = new HashMap();
    this._tmplCache = {};

    this.appendAndCallBack = function(container, html, callBack){
      $(html).appendTo(container);
      if (callBack != undefined){
        callBack();
      }
    };

    this.loadFromUrl = function(templateUrl, callBack){
      var cachedTemplate = $.templateLoader._templateCache.get(templateUrl);
      if (cachedTemplate)
      {
        callBack(cachedTemplate);
        return;
      }
      this.makeAjaxCall(templateUrl, function(templateFromUrl){
        $.templateLoader._templateCache.put(templateUrl, templateFromUrl);
        callBack(templateFromUrl);        
      });

    };

    this.makeAjaxCall = function(templateUrl, callBack){
      $.ajax({
        url     : templateUrl,
        success : function(template){
          callBack(template);
        },
        error   : function(XMLHttpRequest, textStatus, errorThrown) {
          console.log(errorThrown);
        },
        async   : false
      });
    };

    // This function below was taken and altered from Rick Strahl's blog
    // Link: http://www.west-wind.com/Weblog/posts/509108.aspx
    this.parseTemplate = function(template, templateData, callBack) {
      var err = "";
      try {
        var func = this._tmplCache[template];
        if (!func) {
          var strFunc =
            "var p=[],print=function(){p.push.apply(p,arguments);};" +
            "with(obj){p.push('" +

            template.replace(/[\r\t\n]/g, " ")
              .replace(/'(?=[^#]*#\])/g, "\t")
              .split("'").join("\\'")
              .split("\t").join("'")
              .replace(/\[#=(.+?)#\]/g, "',$1,'")
              .split("\[#").join("');")
              .split("#\]").join("p.push('")
              + "');}return p.join('');";

          func = new Function("obj", strFunc);
          this._tmplCache[template] = func;
        }
        callBack(func(templateData));
        return;
      }
      catch (e) {
        err = e.message;
      }
      callBack("< # ERROR: " + err + " # ><br />< # DATA: " + $.toJSON(templateData) + " # >");
    };

  };

  $.templateLoader = new TemplateLoader();

})(jQuery);