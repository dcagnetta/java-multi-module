package hello;

import common.SharedUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class HelloController {
    
  @RequestMapping("/")
  public String getText() {
    return "Jib Multimodule: " + SharedUtils.getText();
  }

}
