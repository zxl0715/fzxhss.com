function CheckAll(form)  {
  for (var i=0;i<form.elements.length;i++)    {
    var e = form.elements[i];
    if (e.name != 'chkall')       e.checked = form.chkall.checked; 
   }
  }
  
   function loaded(myimg,mywidth,myheight){
var tmp_img = new Image();
tmp_img.src=myimg.src;
image_x=tmp_img.width;
image_y=tmp_img.height;
	if(image_x > mywidth){
	tmp_img.height=image_y * mywidth / image_x;
	tmp_img.width=mywidth;
		if(tmp_img.height>myheight){
			tmp_img.width=tmp_img.width * myheight / tmp_img.height;
			tmp_img.height=myheight;
			}
	}else if(image_y > myheight)
	{
	tmp_img.width=image_x * myheight / image_y;
	tmp_img.height=myheight;
		if(tmp_img.width>mywidth){
			tmp_img.height=tmp_img.height * mywidth / tmp_img.width;
			tmp_img.width=mywidth;
			}
	}
	myimg.width=tmp_img.width;
	myimg.height=tmp_img.height;
}
  
 

