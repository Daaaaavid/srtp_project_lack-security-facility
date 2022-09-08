<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<!DOCTYPE html >
<%@page import="java.util.List"%>
<%@page import="bao.labkebiao"%>
<%@page import="java.lang.reflect.Field"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数字电子技术实验室课程表</title>
</head>
<body>
<%
String aa[][]=new String[2][31];
int i=0;
List<labkebiao> list = (List<labkebiao>)request.getAttribute("list");
// 判断集合是否有效
if(list == null || list.size() < 1)
{
	out.print("没有数据！");
} 
else{
	for(labkebiao kebiao1 : list){
		aa[i][0]=kebiao1.getTerm();
		aa[i][1]=kebiao1.getz11();
		aa[i][2]=kebiao1.getz21();
		aa[i][3]=kebiao1.getz31();
		aa[i][4]=kebiao1.getz41();
		aa[i][5]=kebiao1.getz51();
		
		
		aa[i][6]=kebiao1.getz12();
		aa[i][7]=kebiao1.getz22();
		aa[i][8]=kebiao1.getz32();
		aa[i][9]=kebiao1.getz42();
		aa[i][10]=kebiao1.getz52();
		
		aa[i][11]=kebiao1.getz13();
		aa[i][12]=kebiao1.getz23();
		aa[i][13]=kebiao1.getz33();
		aa[i][14]=kebiao1.getz43();
		aa[i][15]=kebiao1.getz53();
		
		aa[i][16]=kebiao1.getz14();
		aa[i][17]=kebiao1.getz24();
		aa[i][18]=kebiao1.getz34();
		aa[i][19]=kebiao1.getz44();
		aa[i][20]=kebiao1.getz54();
		
		aa[i][21]=kebiao1.getz15();
		aa[i][22]=kebiao1.getz25();
		aa[i][23]=kebiao1.getz35();
		aa[i][24]=kebiao1.getz45();
		aa[i][25]=kebiao1.getz55();
		
		aa[i][26]=kebiao1.getz16();
		aa[i][27]=kebiao1.getz26();
		aa[i][28]=kebiao1.getz36();
		aa[i][29]=kebiao1.getz46();
		aa[i][30]=kebiao1.getz56();
		
		i=i+1;
	}
}%>
<table border = 6 frame = void align = center width = 1050px height = 100px cellspacing = 0px cellpadding = 10px style="border: 1px solid green;">


  <tbody id="tablefenye">   


<!-- 单周课表 -->


   
  <tr height = 50px align = center><th width = 110px></th><th><font color = forestgreen size=6px> <%=aa[0][0]%>    </font></th></tr>

   <tr height = 50px align = center>   
       <th width = 110px></th><th><font color = forestgreen size=6px>星期一</font></th><th><font color = forestgreen size=6px>星期二</font></th><th><font color = forestgreen size=6px>星期三</font></th><th><font color = forestgreen size=6px>星期四</font></th><th><font color = forestgreen size=6px>星期五</font></th>
   </tr>
   <tr height = 160px align = center>   
    <td ><font ><b>第一节</b></font></td><td><%=aa[0][1]%></td><td><%=aa[0][2]%></td><td><%=aa[0][3]%></td><td><%=aa[0][4]%></td><td><%=aa[0][5]%></td>
   </tr>
  <tr height = 160px align = center>   
    <td ><font ><b>第二节</b></font></td><td><%=aa[0][6]%></td><td><%=aa[0][7]%></td><td><%=aa[0][8]%></td><td><%=aa[0][9]%></td><td><%=aa[0][10]%></td>
   </tr>
      <tr height = 160px align = center>   
    <td ><font ><b>第三节</b></font></td><td><%=aa[0][11]%></td><td><%=aa[0][12]%></td><td><%=aa[0][13]%></td><td><%=aa[0][14]%></td><td><%=aa[0][15]%></td>
   </tr>

   <tr height = 160px align = center>   
    <td ><font ><b>第四节</b></font></td><td><%=aa[0][16]%></td><td><%=aa[0][17]%></td><td><%=aa[0][18]%></td><td><%=aa[0][19]%></td><td><%=aa[0][20]%></td>
   </tr>
   <tr height = 160px align = center>   
    <td ><font ><b>第五节</b></font></td><td><%=aa[0][21]%></td><td><%=aa[0][22]%></td><td><%=aa[0][23]%></td><td><%=aa[0][24]%></td><td><%=aa[0][25]%></td>
   </tr>
  <tr height = 160px align = center>   
    <td ><font ><b>第六节</b></font></td><td><%=aa[0][26]%></td><td><%=aa[0][27]%></td><td><%=aa[0][28]%></td><td><%=aa[0][29]%></td><td><%=aa[0][30]%></td>
   </tr>
   
<!-- 双周课表 -->


  <tr height = 51px align = center><th width = 111px></th><th><font color = forestgreen size=6px> <%=aa[1][0]%>    </font></th></tr>

   <tr height = 51px align = center>   
       <th width = 111px></th><th><font color = forestgreen size=6px>星期一</font></th><th><font color = forestgreen size=6px>星期二</font></th><th><font color = forestgreen size=6px>星期三</font></th><th><font color = forestgreen size=6px>星期四</font></th><th><font color = forestgreen size=6px>星期五</font></th>
   </tr>
   <tr height = 161px align = center>   
    <td ><font ><b>第一节</b></font></td><td><%=aa[1][1]%></td><td><%=aa[1][2]%></td><td><%=aa[1][3]%></td><td><%=aa[1][4]%></td><td><%=aa[1][5]%></td>
   </tr>
  <tr height = 161px align = center>   
    <td ><font ><b>第二节</b></font></td><td><%=aa[1][6]%></td><td><%=aa[1][7]%></td><td><%=aa[1][8]%></td><td><%=aa[1][9]%></td><td><%=aa[1][10]%></td>
   </tr>
      <tr height = 161px align = center>   
    <td ><font ><b>第三节</b></font></td><td><%=aa[1][11]%></td><td><%=aa[1][12]%></td><td><%=aa[1][13]%></td><td><%=aa[1][14]%></td><td><%=aa[1][15]%></td>
   </tr>

   <tr height = 161px align = center>   
    <td ><font ><b>第四节</b></font></td><td><%=aa[1][16]%></td><td><%=aa[1][17]%></td><td><%=aa[1][18]%></td><td><%=aa[1][19]%></td><td><%=aa[1][20]%></td>
   </tr>
   <tr height = 161px align = center>   
    <td ><font ><b>第五节</b></font></td><td><%=aa[1][21]%></td><td><%=aa[1][22]%></td><td><%=aa[1][23]%></td><td><%=aa[1][24]%></td><td><%=aa[1][25]%></td>
   </tr>
  <tr height = 161px align = center>   
    <td ><font ><b>第六节</b></font></td><td><%=aa[1][26]%></td><td><%=aa[1][27]%></td><td><%=aa[1][28]%></td><td><%=aa[1][29]%></td><td><%=aa[1][30]%></td>
   </tr>
   


 </tbody>   
</table>
<div style=line-height:600px; margin:30px; align="center";">
				    <span id="spanFirst" style="font-size:30px">首页    </span> <span id="spanPre" style="font-size:30px">上一页    </span> <span id="spanNext" style="font-size:30px">下一页    </span> <span id="spanLast" style="font-size:30px">尾页     </span><span  style="font-size:30px">第</span><span id="spanPageNum" style="font-size:30px"></span><span  style="font-size:30px">页/共  </span><span id="spanTotalPage" style="font-size:30px"></span><span style="font-size:30px">页  </span>      
				    </div>

</body>
</html>

<script>   
 
var theTable = document.getElementById("tablefenye");    
var totalPage = document.getElementById("spanTotalPage");    
var pageNum = document.getElementById("spanPageNum");    
   
var spanPre = document.getElementById("spanPre");    
var spanNext = document.getElementById("spanNext");    
var spanFirst = document.getElementById("spanFirst");    
var spanLast = document.getElementById("spanLast");    
   
var numberRowsInTable = theTable.rows.length;    
var pageSize = 8;    
var page = 1;    
   
//下一页    
function next(){    
   
    hideTable();    
        
    currentRow = pageSize * page;    
    maxRow = currentRow + pageSize;    
    if ( maxRow > numberRowsInTable ) maxRow = numberRowsInTable;    
    for ( var i = currentRow; i< maxRow; i++ ){    
        theTable.rows[i].style.display = '';    
    }    
    page++;    
        
    if ( maxRow == numberRowsInTable ) { nextText(); lastText(); }  
    showPage();    
    preLink();    
    firstLink();    
}    
   
//上一页    
function pre(){    
   
    hideTable();    
        
    page--;    
        
    currentRow = pageSize * page;    
    maxRow = currentRow - pageSize;    
    if ( currentRow > numberRowsInTable ) currentRow = numberRowsInTable;    
    for ( var i = maxRow; i< currentRow; i++ ){    
        theTable.rows[i].style.display = '';    
    }    
        
        
    if ( maxRow == 0 ){ preText(); firstText(); }    
    showPage();    
    nextLink();    
    lastLink();    
}    
   
//第一页    
function first(){    
    hideTable();    
    page = 1;    
    for ( var i = 0; i<pageSize; i++ ){    
        theTable.rows[i].style.display = '';    
    }    
    showPage();    
        
    preText();    
    nextLink();    
    lastLink();    
}    
   
//最后一页    
function last(){    
    hideTable();    
    page = pageCount();    
    currentRow = pageSize * (page - 1);    
    for ( var i = currentRow; i<numberRowsInTable; i++ ){    
        theTable.rows[i].style.display = '';    
    }    
    showPage();    
        
    preLink();    
    nextText();    
    firstLink();    
}    
   
function hideTable(){    
    for ( var i = 0; i<numberRowsInTable; i++ ){    
        theTable.rows[i].style.display = 'none';    
    }    
}    
   
function showPage(){     
 pageNum.innerHTML = page;
}    
   
//总共页数    
function pageCount(){    
    var count = 0;    
    if ( numberRowsInTable%pageSize != 0 ) count = 1;     
    return parseInt(numberRowsInTable/pageSize) + count;    
}    
   
//显示链接    
function preLink(){ spanPre.innerHTML = "<a href='javascript:pre();'>上一页</a>";}    
function preText(){ spanPre.innerHTML = "上一页";}    
   
function nextLink(){ spanNext.innerHTML = "<a href='javascript:next();'>下一页</a>";}    
function nextText(){ spanNext.innerHTML = "下一页";}    
   
function firstLink(){ spanFirst.innerHTML = "<a href='javascript:first();'>首页</a>";}    
function firstText(){ spanFirst.innerHTML = "首页";}    
   
function lastLink(){ spanLast.innerHTML = "<a href='javascript:last();'>尾页</a>";}    
function lastText(){ spanLast.innerHTML = "尾页";}    
//隐藏表格    
function hide(){    
    for ( var i = pageSize; i<numberRowsInTable; i++ ){    
        theTable.rows[i].style.display = 'none';    
    }    
        
    totalPage.innerHTML = pageCount();    
    pageNum.innerHTML = '1';    
        
    nextLink();    
    lastLink();    
}    
   
hide(); 
   
</script>