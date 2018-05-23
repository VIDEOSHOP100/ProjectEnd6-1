package com.iii._16_.PDF.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii._16_.OrderSystem.Order.model.OrderBean;
import com.iii._16_.OrderSystem.OrderProduct.model.OrderProductBean;
import com.iii._16_.OrderSystem.OrderProduct.model.OrderProductService;
import com.iii._16_.ProductSale.Product.model.ProductSaleBean;
import com.iii._16_.ProductSale.Product.model.ProductSaleService;
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
	@Autowired
	ProductSaleService productservice;
	Document document = null;

	public void pdfProduce(OrderBean odbean) throws DocumentException, IOException, SQLException {
		// // CSS
		// CSSResolver cssResolver =
		// XMLWorkerHelper.getInstance().getDefaultCssResolver(true);
		// // HTML
		// HtmlPipelineContext htmlContext = new HtmlPipelineContext(null);
		// htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
		// htmlContext.autoBookmark(false);
		// // Pipelines
		// ElementList elements = new ElementList();
		// ElementHandlerPipeline end = new ElementHandlerPipeline(elements, null);
		// HtmlPipeline html = new HtmlPipeline(htmlContext, end);
		// CssResolverPipeline css = new CssResolverPipeline(cssResolver, html);
		// // XML Worker
		// XMLWorker worker = new XMLWorker(css, true);
		// XMLParser p = new XMLParser(worker);
		// p.parse(new FileInputStream(HTML));
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
			Font font1 = new Font(bfChinese, 10, Font.BOLD, new BaseColor(0, 0, 0));
			Font font2 = new Font(bfChinese, 20, Font.BOLD, new BaseColor(255, 0, 0));

			// 匯入圖片
			Image image2 = Image.getInstance("c:/resources/OrderPdf/LiveMarketLogo.jpg");
			Paragraph pspace = new Paragraph();
			pspace.add(new Phrase("              ", font));
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
			Paragraph p11 = new Paragraph();
			Paragraph p12 = new Paragraph();

			List<OrderProductBean> productlist = opservice.getByorderSeqNo(odbean.getOrderSeqNo());

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
			p11.add(new Phrase("    ", font));
			p11.setSpacingBefore(10f);
			//取出該訂單的商品資訊 放入paragraph
			List<Paragraph> paragraphlist = new ArrayList<>();
//			List<Integer> namelen = new ArrayList<>();
			
			int i =1;
			for (OrderProductBean orderbean : productlist) {
				Paragraph paragraph = new Paragraph();
				ProductSaleBean oneproduct = productservice.getBySeqNo(orderbean.getProductSeqNo());
//				int proNamelen = oneproduct.getProName().length();
				
				paragraph.add(new Phrase(String.valueOf(i)+". ",font1));
				paragraph.setSpacingBefore(10f);
				paragraph.add(new Phrase("商品名稱 :"+ oneproduct.getProName()+"    ",font1));
				paragraph.setSpacingBefore(10f);
				paragraph.add(new Phrase("商品數量 :"+ String.valueOf(orderbean.getProductCount())+"    ",font1));
				paragraph.setSpacingBefore(10f);
				paragraph.add(new Phrase("商品單價 :NT"+ String.valueOf(orderbean.getProductPrice())+"元      ",font1));
				paragraph.setSpacingBefore(10f);
				paragraph.add(new Phrase("商品總價 :NT"+ String.valueOf(orderbean.getProductTotal())+"元      ",font1));
				paragraph.setSpacingBefore(10f);
				paragraph.add(new Phrase(" ", font1));
				paragraph.setSpacingBefore(10f);
				paragraphlist.add(paragraph);
				i++;
//				namelen.add(proNamelen);
			}
//			String space = " ";
//		    Integer max1 = Collections.max(namelen);
//		    for(int i=0 ; i<=max1 ;i ++) {
//		    	space += " ";
//		    }

		    	 
			

			Paragraph para1 = new Paragraph();
			Anchor anchorTarget2 = new Anchor("                             " + "LiveMarket線上訂單明細", font2);
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
//			cell.addElement(p12);
			for (Paragraph readyp : paragraphlist) {
				cell.addElement(readyp);
			}
			table1.addCell(cell);
			table1.setSpacingBefore(20f);

		
			 PdfPTable table2 = new PdfPTable(1);
			// table2.setWidthPercentage(100);
			// table2.setHorizontalAlignment(10);
			//
			 PdfPCell cell2 = new PdfPCell();
			//
			 Paragraph pp = new Paragraph();
			 Paragraph pp1 = new Paragraph();
			// 
			Anchor anchorTarget3 = new Anchor("                          " + "LiveMartket  感謝您的蒞臨", font2);
			Anchor anchorTarget4 = new Anchor("               " + "LiveMarket 聯絡方式  :  livemarket@gmail.com", font2);
			pp.setSpacingBefore(10f);
			pp.add(anchorTarget3);
			pp1.setSpacingBefore(10f);
			pp1.add(anchorTarget4);

		

			document.add(para1);
			document.add(table1);
	
			document.add(pp);
			document.add(pp1);
		} finally {
			System.out.println(document);
			document.close();
		}
		// 寫出PDF
		byte[] pdf = out.toByteArray();
		FileOutputStream fos = new FileOutputStream("c:/resources/OrderPDF/" + odbean.getOrderSeqNo() + ".pdf");

		fos.write(pdf);
		fos.flush();
		fos.close();

	}

	public void imgProduce(ServletContext servletContext) throws IOException {
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
