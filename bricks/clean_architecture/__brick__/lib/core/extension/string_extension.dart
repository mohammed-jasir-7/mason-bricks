extension StringExtensions on String { 
  String capitalize() { 
    if(this.isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1)}"; 
  } 
  String capitalizeAll(String pattern) { 
    return "${this.split(pattern).map((e) => e.capitalize()).join(' ')}"; 
  } 

  String replaceAllUnderscore(){
    return this.replaceAll(RegExp('_'), ' ');
  }
  String replaceAllHyphen(){
    return this.replaceAll(RegExp('-'), ' ');
  }
} 