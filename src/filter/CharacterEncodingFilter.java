package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter{

   // 필터가없을때는 request와 response객체마다 인코딩을 일일히 타이핑해야하는 번거로움이 있었지만
   // 인코딩필터 클래스를 만듬으로써 단지 동작시키기만하면 자동으로 요청과 응답을 인코딩해주는 편리함을 제공한다.
   private String encoding;
   
   @Override
   public void destroy() {
      
   }

   @Override
   public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
         throws IOException, ServletException {

      req.setCharacterEncoding(this.encoding);
      resp.setCharacterEncoding(this.encoding);
      
      chain.doFilter(req, resp);
   }

   @Override
   public void init(FilterConfig filterConfig) throws ServletException {

      if(filterConfig.getInitParameter("encoding") == null) {
         this.encoding = "UTF-8";
      }else {
         this.encoding = filterConfig.getInitParameter("encoding");
      }
      
      System.out.println("현재 설정된 인코딩 값 : " + this.encoding);
      
      
      
   }

   
   
}