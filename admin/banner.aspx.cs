using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_banner : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    #region 生成缩略图
    /// <summary>
    /// 生成缩略图
    /// </summary>
    /// <param name="originalImagePath">源图路径（物理路径）</param>
    /// <param name="thumbnailPath">缩略图路径（物理路径）</param>
    /// <param name="width">缩略图宽度</param>
    /// <param name="height">缩略图高度</param>
    /// <param name="mode">生成缩略图的方式</param>    
    public static void MakeThumbnail(string originalImagePath, string thumbnailPath, int width, int height, string mode)
    {
        System.Drawing.Image originalImage = System.Drawing.Image.FromFile(originalImagePath);

        int towidth = width;
        int toheight = height;

        int x = 0;
        int y = 0;
        int ow = originalImage.Width;
        int oh = originalImage.Height;

        switch (mode)
        {
            case "HW"://指定高宽缩放（可能变形）                
                break;
            case "W"://指定宽，高按比例                    
                toheight = originalImage.Height * width / originalImage.Width;
                break;
            case "H"://指定高，宽按比例
                towidth = originalImage.Width * height / originalImage.Height;
                break;
            case "Cut"://指定高宽裁减（不变形）                
                if ((double)originalImage.Width / (double)originalImage.Height > (double)towidth / (double)toheight)
                {
                    oh = originalImage.Height;
                    ow = originalImage.Height * towidth / toheight;
                    y = 0;
                    x = (originalImage.Width - ow) / 2;
                }
                else
                {
                    ow = originalImage.Width;
                    oh = originalImage.Width * height / towidth;
                    x = 0;
                    y = (originalImage.Height - oh) / 2;
                }
                break;
            default:
                break;
        }
        //新建一个bmp图片
        System.Drawing.Image bitmap = new System.Drawing.Bitmap(towidth, toheight);

        //新建一个画板
        System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(bitmap);

        //设置高质量插值法
        g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;

        //设置高质量,低速度呈现平滑程度
        g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;

        //清空画布并以透明背景色填充
        g.Clear(System.Drawing.Color.Transparent);

        //在指定位置并且按指定大小绘制原图片的指定部分
        g.DrawImage(originalImage, new System.Drawing.Rectangle(0, 0, towidth, toheight),
            new System.Drawing.Rectangle(x, y, ow, oh),
            System.Drawing.GraphicsUnit.Pixel);

        try
        {
            //以jpg格式保存缩略图
            bitmap.Save(thumbnailPath, System.Drawing.Imaging.ImageFormat.Jpeg);
        }
        catch (System.Exception e)
        {
            throw e;
        }
        finally
        {
            originalImage.Dispose();
            bitmap.Dispose();
            g.Dispose();
        }
    }
    #endregion

    #region 上传图片
    /// <summary>
    /// 上传图片
    /// </summary>
    /// <param name="fileUpLoad">上传控件</param>
    /// <param name="fileName">图片名称</param>
    private void bannerImg(FileUpload fileUpLoad, string fileName)
    {
        if (fileUpLoad.HasFile)
        {
            string fileName_s = "s_" + fileName;
            string fileContentType = fileUpLoad.PostedFile.ContentType.ToLower();
            if (fileContentType == "image/bmp" || fileContentType == "image/gif" || fileContentType == "image/jpeg" || fileContentType == "image/png")
            {
                string name = fileUpLoad.PostedFile.FileName;                  // 客户端文件路径

                FileInfo file = new FileInfo(name);
                // 文件名称
                // 缩略图文件名称
                string webFilePath = Server.MapPath("../images/" + fileName);        // 服务器端文件路径
                string webFilePath_s = Server.MapPath("../images/" + fileName_s);　　// 服务器端缩略图路径            

                if (File.Exists(webFilePath))
                {
                    File.Delete(webFilePath);
                }
                if (File.Exists(webFilePath_s))
                {
                    File.Delete(webFilePath_s);
                }
                try
                {
                    string fn = fileName;
                    fileUpLoad.SaveAs(webFilePath);                                // 使用 SaveAs 方法保存文件
                    MakeThumbnail(webFilePath, webFilePath_s, 1000, 350, "Cut");     // 生成缩略图方法
                    Response.Write("<script>alert('成功上传。');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('提示：文件上传失败，失败原因：" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('提示：文件类型不符。');</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('提示：请选择上传文件。');</script>");
        }
    }
    #endregion

    #region 上传图片一
    protected void btnImg1_Click(object sender, EventArgs e)
    {
        bannerImg(FileUpload1, "index_banner1.jpg");
    }
    #endregion
    #region 上传图片二
    protected void btnImg2_Click(object sender, EventArgs e)
    {
        bannerImg(FileUpload2, "index_banner2.jpg");
    }
    #endregion

    #region 上传图片三
    protected void btnImg3_Click(object sender, EventArgs e)
    {
        bannerImg(FileUpload3, "index_banner3.jpg");
    }
    #endregion

    #region 上传图片四
    protected void btnImg4_Click(object sender, EventArgs e)
    {
        bannerImg(FileUpload4, "index_banner4.jpg");
    }
    #endregion

    #region 上传图片五
    protected void btnImg5_Click(object sender, EventArgs e)
    {
        bannerImg(FileUpload5, "index_banner5.jpg");
    }
    #endregion

    #region 上传图片六
    protected void btnImg6_Click(object sender, EventArgs e)
    {
        bannerImg(FileUpload6, "index_banner6.jpg");
    }
    #endregion

}