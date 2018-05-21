package com.iii._16_.PDF.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii._16_.OrderSystem.Order.model.OrderBean;
import com.iii._16_.OrderSystem.OrderProduct.model.OrderProductService;
import com.itextpdf.text.Anchor;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;


@Service
public class PdfProduceService {
	@Autowired
	OrderProductService opservice;
	Document document = null;

	public void pdfProduce(OrderBean odbean) throws DocumentException, IOException {
//		// CSS
//        CSSResolver cssResolver =
//                XMLWorkerHelper.getInstance().getDefaultCssResolver(true);
//        // HTML
//        HtmlPipelineContext htmlContext = new HtmlPipelineContext(null);
//        htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
//        htmlContext.autoBookmark(false);
//        // Pipelines
//        ElementList elements = new ElementList();
//        ElementHandlerPipeline end = new ElementHandlerPipeline(elements, null);
//        HtmlPipeline html = new HtmlPipeline(htmlContext, end);
//        CssResolverPipeline css = new CssResolverPipeline(cssResolver, html);
//        // XML Worker
//        XMLWorker worker = new XMLWorker(css, true);
//        XMLParser p = new XMLParser(worker);
//        p.parse(new FileInputStream(HTML));
//    	
		document = new Document(PageSize.A4, 50, 50, 25, 50);

		ByteArrayOutputStream out = new ByteArrayOutputStream();
		// PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(go));
		try {
	    	// step 1
	        PdfWriter.getInstance(document, out);
			document.open();
			// begin
			// 將字體轉成中文
			BaseFont bfChinese = BaseFont.createFont("C:/Windows/Fonts/mingliu.ttc,1", BaseFont.IDENTITY_H,
					BaseFont.NOT_EMBEDDED);
			Font font = new Font(bfChinese, 14, Font.BOLD, new BaseColor(0, 0, 0));
			Font font2 = new Font(bfChinese, 20, Font.BOLD, new BaseColor(255, 0, 0));

	        // 匯入圖片
			Image image2 = Image.getInstance("c:/resources/OrderPdf/LiveMarketLogo.jpg");
			Paragraph pspace = new Paragraph();
			pspace.add(new Phrase("              ",font));
			image2.scaleAbsolute(350f, 100f);
			document.add(pspace);
			document.add(image2);
			
	
	 
			// // table1
			PdfPTable table1 = new PdfPTable(1);
			table1.setWidthPercentage(100);
			PdfPCell cell = new PdfPCell();
			Paragraph p = new Paragraph();
			// p.add(new Chunk(image2, 0, 0));
			// p.add(new Phrase("訂單編號：2018XXXXXXX", font));
			p.add(new Phrase("訂單編號" + odbean.getOrderSeqNo(), font));

			Paragraph p3 = new Paragraph();
			Paragraph p4 = new Paragraph();
			Paragraph p5 = new Paragraph();
			Paragraph p6 = new Paragraph();
			Paragraph p7 = new Paragraph();
			Paragraph p8 = new Paragraph();
			Paragraph p9 = new Paragraph();
			Paragraph p10 = new Paragraph();
			Paragraph p11= new Paragraph();
			Paragraph p12= new Paragraph();
			// p3.add(new Phrase("去程：台北桃園機場 2018XXXXXXX XX:XX ~ 台北桃園機場 2018XXXXXXX XX:XX",
			// font));
			p3.add(new Phrase("訂購人姓名：" + odbean.getOrdererName(), font));
			p3.setSpacingBefore(10f);
			p4.add(new Phrase("訂購人Email：" + odbean.getOrdererEmail(), font));
			p4.setSpacingBefore(10f);
			p5.add(new Phrase("訂購人Tel：" + odbean.getOrdererTel(), font));
			p5.setSpacingBefore(10f);
			p6.add(new Phrase("訂購人地址：" + odbean.getOrdererAddr(), font));
			p6.setSpacingBefore(10f);
		
			p7.add(new Phrase("收件人姓名：" + odbean.getRecipientName(), font));
			p7.setSpacingBefore(10f);
			p8.add(new Phrase("收件人Email：" + odbean.getRecipientEmail(), font));
			p8.setSpacingBefore(10f);
			p9.add(new Phrase("收件人Tel：" + odbean.getRecipientTel(), font));
			p9.setSpacingBefore(10f);
			p10.add(new Phrase("收件人地址：" + odbean.getRecipientAddr(), font));
			p10.setSpacingBefore(10f);
			p11.add(new Phrase("    " , font));
			p11.setSpacingBefore(10f);


			Paragraph para1 = new Paragraph();
			Anchor anchorTarget2 = new Anchor("                             "+"LiveMarket線上訂單明細", font2);
			para1.setSpacingBefore(10f);
			para1.add(anchorTarget2);

			cell.addElement(p);
			cell.addElement(p3);
			cell.addElement(p4);
			cell.addElement(p5);
			cell.addElement(p6);
			cell.addElement(p7);
			cell.addElement(p8);
			cell.addElement(p9);
			cell.addElement(p10);
			cell.addElement(p11);
			
			table1.addCell(cell);
			table1.setSpacingBefore(20f);

			// // table2 旅客資訊
			PdfPTable table2 = new PdfPTable(1);
			table2.setWidthPercentage(100);
			table2.setHorizontalAlignment(10);

			PdfPCell cell2 = new PdfPCell();
			
			Paragraph pp = new Paragraph();
			
			pp.add(new Phrase("訂購商品資訊  見官網" + font));
			pp.setSpacingBefore(10f);
		    pp.setSpacingAfter(10f);
			cell2.addElement(pp);
			table2.addCell(cell2);
			
//			java.util.List<OrderProductBean> list = opservice.getByorderSeqNo(odbean.getOrderSeqNo());
//	
//		
//			for( int i=1 ;i<=list.size(); i++) {
//			Paragraph ppp = new Paragraph();
//			pp.add(new Phrase("商品 :  " +  ",  單價  :"  +   ", 數量  :"  +k  +"   " + font));
//			
//			}
//			PdfPCell cell21 = new PdfPCell();
//
//			Paragraph p21 = new Paragraph();
//			p21.add(new Phrase("旅客1：" + odbean.getOrdererName()
//					+ font));
//			p21.setSpacingBefore(10f);
//
//			Paragraph p22 = new Paragraph();
//			p22.add(new Phrase("旅客2：GAY FOOTER" + "性別+", font));
//			p22.setSpacingBefore(10f);
//			p22.setSpacingAfter(10f);
//
//			cell21.addElement(p21);
//			cell21.addElement(p22);
//			table2.addCell(cell21);
			table2.setSpacingBefore(20f);

			document.add(para1);
			document.add(table1);
			document.add(table2);

		} finally {
			System.out.println(document);
			document.close();
		}
		// 寫出PDF
		byte[] pdf = out.toByteArray();
		FileOutputStream fos = new FileOutputStream("c:/resources/OrderPDF/" + odbean.getOrderSeqNo()+".pdf");
		
		
		
		fos.write(pdf);
		fos.flush();
		fos.close();

	}


	public void imgProduce(ServletContext servletContext ) throws IOException {
		InputStream is = servletContext.getResourceAsStream("/WEB-INF/images/LiveMarketLogo.jpg");
																		
		FileOutputStream fos = null;
		File file = new File("c:/resources/OrderPDF");
		if (!file.exists()) {
			file.mkdirs();
		}

		byte[] b = new byte[8192];
		int len = 0;
		try {
			fos = new FileOutputStream("c:/resources/OrderPDF/" + "LiveMarketLogo.jpg");
			while ((len = is.read(b)) != -1) {
				fos.write(b, 0, len);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (fos != null) {
				fos.close();
			}
		}
		System.out.println("圖片創建完成");
	}
}
