/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;
 
import java.util.Arrays;
import java.util.List;
public class myArray {
  public static boolean contains(Integer[] arr, Integer item) {
      List<Integer> list = Arrays.asList(arr);
      return list.contains(item);
   }  
}

 