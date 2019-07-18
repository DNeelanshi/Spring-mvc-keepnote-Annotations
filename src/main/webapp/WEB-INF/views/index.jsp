
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KeepNote</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
   #table th,#table td,#table tr{
        padding: 10px;
        border: 3px solid ;
        align-items: center;
        align-content: center;
        text-align:center;
        width: 18%;
    }
    #form{
    margin: 0 auto;
    width: 70%;
    display: flex;
    flex-direction: column;
    flex-wrap: wrap;
    justify-content: space-around;
    align-items: center;
    align-content: space-around;
    }
    #table{
    width: 70%;
    border: 1px solid black;
    margin: 0 auto;
    margin-top: 18px;
    }
</style>

</head>
<body>
 <p style="color:red;">${error}</p>

<form action = "saveNote" method = "post" id="form">
<label>Note Id: </label>
<input type="Integer" name="noteId" required>
<label>Note Title: </label>
<input type="text" name="noteTitle" required>
<label>Note Content: </label>
<input type="text" name="noteContent" required>
<label>Note Status: </label>
<input type="text" name="noteStatus" required>
<button type="submit">Submit</button>
</form>


	<!-- display all existing notes in a tabular structure with Id, Title,Content,Status, Created Date and Action -->
		 <c:if test = "${list.size() > 0}">
    	<table id="table">
            <tbody>
                <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Content</th>
    			<th>Status</th>
    			<th>Create At</th>
                </tr>
                 <c:forEach items="${list}" var="noteVar">
    	            <tr>
    	       			<td>${noteVar.noteId}</td>
    	                <td>${noteVar.noteTitle}</td>
    	                <td>${noteVar.noteContent}</td>
    	                <td>${noteVar.noteStatus}</td>
    	                <td>${noteVar.createdAt}<a href="/deleteNote?noteId=${noteVar.noteId}"><button>delete</button></a></td>
    	            </tr>
          		</c:forEach>
            </tbody>
        </table>
        </c:if>
    </c>
</body>

</html>