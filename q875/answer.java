// ClientDivision.java
/**
 * 顧客区分
 * 
 * 顧客区分および区分ごとの料金を保持する.
 */
public enum ClientDivision {
  ADULT("おとな", 100),
  CHILD("こども", 50),
  AGED("シルバー", 20);

  private final String name;
  private final Integer price;

  private ClientDivision(final String name, Integer price) {
    this.name = name;
    this.price = price;
  }

  /**
   * 価格を返却する.
   * 
   * @return 価格
   */
  public Integer getPrice() {
    return this.price;
  }

  /**
   * 区分名を返却する.
   * 
   * @return 区分名
   */
  public String getName() {
    return name;
  }

  /**
   * 価格表を返却する.
   * 
   * @return 価格表
   */
  public String getPriceList() {
    return String.format("%d / \"%s\"", getPrice(), getName());
  }
}

// ClientDivisionUserSample.java
import java.util.Arrays;
import java.util.List;

public class ClientDivisionUseSample {
  public static void main(String[] args) {
    List<ClientDivision> clientDivisions = Arrays.asList(ClientDivision.ADULT, ClientDivision.CHILD, ClientDivision.AGED);
    for (ClientDivision clientDivision : clientDivisions) {
      System.out.println(clientDivision.getPriceList());
    }
  }
}
