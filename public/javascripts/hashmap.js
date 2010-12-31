
HashMap = function(){
  this._dict = [];

  this.put = function(key, value){
    var item = this._get(key);
    if (item){
      this._get(key)[1] = value;
    } else {
      this._dict.push([key, value]);
    }
    return this;
  };

  this.get = function(key){
    var item = this._get(key);
    if (item){
      return this._get(key)[1];
    }
  };

  this._get = function(key){
    for(var i=0, couplet; couplet = this._dict[i]; i++){
      if(couplet[0] === key){
        return couplet;
      }
    }
    return undefined;
  };
};