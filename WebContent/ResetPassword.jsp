<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="s" uri="/struts-tags"%>

<s:actionerror/>
<s:form action="resetPwd"  validate="true" valign="top">
<s:textfield name="username" key="label.username" size="20" />
<s:submit  key="label.reset" align="center" />
</s:form>
