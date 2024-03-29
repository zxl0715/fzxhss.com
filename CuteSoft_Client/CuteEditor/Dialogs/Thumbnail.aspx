<%@ Page Language="C#" Inherits="CuteEditor.Dialogs.ThumbnailPage" %>
<script runat="server">
override protected void OnInit(EventArgs args)
{
	if(Context.Request.QueryString["IsFrame"]==null)
	{
		string FrameSrc="Thumbnail.aspx?IsFrame=1&"+Request.ServerVariables["QUERY_STRING"];
		CuteEditor.CEU.WriteDialogOuterFrame(Context,"[[AutoThumbnail]]",FrameSrc);
		Context.Response.End();
	}
	base.OnInit(args);
}
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>[[AutoThumbnail]] 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</title>
		
		<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.1)" />
		<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.1)" />
		<link href="Load.ashx?type=style&file=dialog.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="Load.ashx?type=dialogscript&file=DialogHead.js"></script>
	</head>
	<body style="margin:0px;border-width:0px;padding:4px;">
		<form runat="server" id="Form1">
			<input type="hidden" runat="server" id="hiddenDirectory" name="hiddenDirectory" /> 
			<input type="hidden" runat="server" id="hiddenFile" name="hiddenFile" />
			<input type="hidden" runat="server" enableviewstate="false" id="hiddenAlert" name="hiddenAlert" /> 
			<input type="hidden" runat="server" enableviewstate="false" id="hiddenAction" name="hiddenAction" />
		<table border="0" cellpadding="4" cellspacing="0" width="100%">
			<tr>
				<td>
					<table border="0" cellpadding="1" cellspacing="4" class="normal">
					<tr>
						<td style="white-space:nowrap"  valign="top">
							<fieldset style="height:80px;">
								<table border="0" cellpadding="1" cellspacing="0" class="normal">
									<tr>
										<td style="white-space:nowrap; width:60" >[[Width]]:</td>
										<td>
											<input runat="server" id="inp_width" value="80" maxlength="3" onkeyup="checkConstrains('width');"  onkeypress="return CancelEventIfNotDigit()" style="WIDTH : 70px" name="inp_width" />
										</td>
										<td rowspan="2" align="right" valign="middle"><img src="Load.ashx?type=image&file=locked.gif" id="imgLock" width="25" height="32" alt="[[ConstrainProportions]]" /></td>
									</tr>
									<tr>
										<td>[[Height]]:</td>
										<td>
											<input runat="server" id="inp_height" value="80" maxlength="3" onkeyup="checkConstrains('height');"  onkeypress="return CancelEventIfNotDigit()" style="WIDTH : 70px" name="inp_height" />
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<input type="checkbox" id="constrain_prop" checked="checked" onclick="javascript:toggleConstrains();" />
											Constrain Proportions</td>
									</tr>
								</table>
							</fieldset>		
						</td>
						<td valign="top" style="white-space:nowrap" >
							<div style="width:100px; height:80px; vertical-align:top;overflow:hidden;BACKGROUND-COLOR: #ffffff;BORDER-RIGHT: buttonhighlight 1px solid;BORDER-TOP: buttonshadow 1px solid;BORDER-LEFT: buttonshadow 1px solid;BORDER-BOTTOM: buttonhighlight 1px solid;">
								<img alt="" id="img_demo" src="Load.ashx?type=image&file=1x1.gif" />
							</div>
						</td>
					</tr>	
					<tr>
						<td>
							<div style="margin-top:8px;text-align:center">
								<asp:Button CssClass="btn"  id="okButton" Text="  [[OK]]  " Runat="server" OnClick="thumbnailButton_Click" />
								&nbsp;&nbsp;
								<input type="button" value="[[Cancel]]" onclick="top.returnValue=false;top.close()" />
							</div>
						</td>
					</tr>				
				</table>
			</td>
		</tr>
		</table>
	</form>			
	</body>
</html>
	
		<script type="text/javascript">
			var OxO3e6f=["src","img_demo","inp_width","inp_height","hiddenFile","hiddenAlert","hiddenDirectory","hiddenAction","onload","value","","width","height","[[ImagetooSmall]]","dir","imgLock","constrain_prop","checked","Load.ashx?type=image\x26file=locked.gif","Load.ashx?type=image\x26file=1x1.gif","preview_image","DIV","cssText","style","position:absolute","body","offsetWidth","offsetHeight","length"];var obj=Window_GetDialogArguments(window);var src=obj[OxO3e6f[0x0]];var img_demo=document.getElementById(OxO3e6f[0x1]);var inp_width=document.getElementById(OxO3e6f[0x2]);var inp_height=document.getElementById(OxO3e6f[0x3]);var hiddenFile=Window_GetElement(window,OxO3e6f[0x4],true);var hiddenAlert=Window_GetElement(window,OxO3e6f[0x5],true);var hiddenDirectory=Window_GetElement(window,OxO3e6f[0x6],true);var hiddenAction=Window_GetElement(window,OxO3e6f[0x7],true);var defaultwidth=<%= secset.ThumbnailWidth %>;var defaultheight=<%= secset.ThumbnailHeight %>; window[OxO3e6f[0x8]]=reset_hiddens ; function reset_hiddens(){if(hiddenAction[OxO3e6f[0x9]]!=OxO3e6f[0xa]){if(hiddenAlert[OxO3e6f[0x9]]){ alert(hiddenAlert.value) ;} ; Window_SetDialogReturnValue(window,hiddenAction.value) ; Window_CloseDialog(window) ;} else { hiddenAlert[OxO3e6f[0x9]]=OxO3e6f[0xa] ; hiddenAction[OxO3e6f[0x9]]=OxO3e6f[0xa] ;} ;}  ; SyncToView() ; function SyncToView(){if(src){var img= new Image(); img[OxO3e6f[0x0]]=src ; img_demo[OxO3e6f[0x0]]=src ;var p1=parseInt(img[OxO3e6f[0xb]]/defaultwidth);var Oxd3=parseInt(img[OxO3e6f[0xc]]/defaultheight);if(p1>Oxd3){if(img[OxO3e6f[0xb]]<defaultwidth){ alert(OxO3e6f[0xd]) ; inp_width[OxO3e6f[0x9]]=img[OxO3e6f[0xb]] ; inp_height[OxO3e6f[0x9]]=img[OxO3e6f[0xc]] ;} else { inp_width[OxO3e6f[0x9]]=defaultwidth ;var Oxd4=parseInt(defaultwidth*img[OxO3e6f[0xc]]/img.width); inp_height[OxO3e6f[0x9]]=Oxd4 ;} ;} else {if(img[OxO3e6f[0xc]]<defaultheight){ alert(OxO3e6f[0xd]) ; inp_width[OxO3e6f[0x9]]=img[OxO3e6f[0xb]] ; inp_height[OxO3e6f[0x9]]=img[OxO3e6f[0xc]] ;} else { inp_height[OxO3e6f[0x9]]=defaultheight ;var Oxd5=parseInt(defaultwidth*img[OxO3e6f[0xb]]/img.height); inp_width[OxO3e6f[0x9]]=Oxd5 ;} ;} ; hiddenFile[OxO3e6f[0x9]]=src ; hiddenDirectory[OxO3e6f[0x9]]=obj[OxO3e6f[0xe]] ; do_preview() ;} ;}  ; function toggleConstrains(){var Oxd7=document.getElementById(OxO3e6f[0xf]);var Oxd8=document.getElementById(OxO3e6f[0x10]);if(Oxd8[OxO3e6f[0x11]]){ Oxd7[OxO3e6f[0x0]]=OxO3e6f[0x12] ; checkConstrains(OxO3e6f[0xb]) ;} else { Oxd7[OxO3e6f[0x0]]=OxO3e6f[0x13] ;} ;}  ;var checkingConstrains=false; function checkConstrains(Oxdb){if(checkingConstrains){return ;} ; checkingConstrains=true ;try{var Oxd8=document.getElementById(OxO3e6f[0x10]);if(Oxd8[OxO3e6f[0x11]]){var Oxdc=document.getElementById(OxO3e6f[0x14]);if(Oxdc){var Oxdd=document.createElement(OxO3e6f[0x15]); Oxdd[OxO3e6f[0x17]][OxO3e6f[0x16]]=OxO3e6f[0x18] ; document[OxO3e6f[0x19]].appendChild(Oxdd) ; Oxdd.appendChild(Oxdc) ; Oxdc.removeAttribute(OxO3e6f[0xb]) ; Oxdc.removeAttribute(OxO3e6f[0xc]) ; Oxdc[OxO3e6f[0x17]][OxO3e6f[0xb]]=OxO3e6f[0xa] ; Oxdc[OxO3e6f[0x17]][OxO3e6f[0xc]]=OxO3e6f[0xa] ; original_width=Oxdc[OxO3e6f[0x1a]] ; original_height=Oxdc[OxO3e6f[0x1b]] ; Oxdd.removeNode(true) ;} else {var Oxde= new Image(); Oxde[OxO3e6f[0x0]]=src ; original_width=Oxde[OxO3e6f[0xb]] ; original_height=Oxde[OxO3e6f[0xc]] ;} ;if((original_width>0x0)&&(original_height>0x0)){ width=inp_width[OxO3e6f[0x9]] ; height=inp_height[OxO3e6f[0x9]] ;if(Oxdb==OxO3e6f[0xb]){if(width[OxO3e6f[0x1c]]==0x0||isNaN(width)){ inp_width[OxO3e6f[0x9]]=OxO3e6f[0xa] ; inp_height[OxO3e6f[0x9]]=OxO3e6f[0xa] ;} else { height=parseInt(width*original_height/original_width) ; inp_height[OxO3e6f[0x9]]=height ;} ;} ;if(Oxdb==OxO3e6f[0xc]){if(height[OxO3e6f[0x1c]]==0x0||isNaN(height)){ inp_width[OxO3e6f[0x9]]=OxO3e6f[0xa] ; inp_height[OxO3e6f[0x9]]=OxO3e6f[0xa] ;} else { width=parseInt(height*original_width/original_height) ; inp_width[OxO3e6f[0x9]]=width ;} ;} ;} ;} ; do_preview() ;} finally{ checkingConstrains=false ;} ;}  ; function do_preview(){ img_demo[OxO3e6f[0xb]]=inp_width[OxO3e6f[0x9]] ; img_demo[OxO3e6f[0xc]]=inp_height[OxO3e6f[0x9]] ;}  ;	
			
		</script>
