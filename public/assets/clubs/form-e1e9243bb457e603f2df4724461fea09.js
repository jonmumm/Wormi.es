$(document).ready(function(){return $("#club_volume_id").tokenInput("https://www.googleapis.com/books/v1/volumes?key=AIzaSyD5a1RmDzOb8csAUwc29uZhF7jdsL48yYI",{jsonContainer:"items",tokenLimit:1,onResult:function(a){return $.each(a.items,function(a,b){return b.name=b.volumeInfo.title}),console.log(a),a}})})