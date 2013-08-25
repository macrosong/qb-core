<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:str="http://www.quickbundle.org" >
	<!--导入全局定义-->
	<xsl:import href="../../global.xsl"/>
	<!--忽略xml声明-->
	<xsl:output method="text" encoding="UTF-8" escape-uri-attributes="yes" name="rm-text"/>
<xsl:param name="targetFullPath"></xsl:param>
	<!--处理table-->
	<xsl:template match="table[1]">
<xsl:for-each select="/meta/relations/mainTable[@tableName=$tableName]/refTable[count(middleTable)>0]">
    <xsl:result-document href="{$targetFullPath}/list{str:upperFirst(lower-case(middleTable/@tableName))}.jsp" format="rm-text">
<xsl:value-of select="$charLt"/>%@ page contentType="text/html; charset=UTF-8" language="java" %>
<xsl:value-of select="$charLt"/>%@ page import="java.util.List" %>
<xsl:value-of select="$charLt"/>%@page import="org.quickbundle.base.web.page.RmPageVo"%>
<xsl:value-of select="$charLt"/>%@page import="org.quickbundle.project.common.vo.RmCommonVo"%>
<xsl:value-of select="$charLt"/>%@page import="org.quickbundle.project.RmProjectHelper"%>
<xsl:value-of select="$charLt"/>%@page import="org.quickbundle.project.IGlobalConstants"%>
<xsl:value-of select="$charLt"/>%@ include file="/jsp/include/web/g.jsp" %>
<xsl:value-of select="$charLt"/>%  //取出List
    String message_id = request.getParameter("message_id");
    List<xsl:value-of select="$charLt"/>RmCommonVo> lvo = RmProjectHelper.getCommonServiceInstance().doQueryPage("select a.*, b.NAME as RM_DISPLAY_COLUMN from RM_M_MESSAGE_USER a join RM_USER b on a.USER_ID = b.ID where a.MESSAGE_ID=" + message_id);
    pageContext.setAttribute(IGlobalConstants.REQUEST_BEANS, lvo);
%>
<xsl:value-of select="$charLt"/>!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<xsl:value-of select="$charLt"/>html>
<xsl:value-of select="$charLt"/>head>
<xsl:value-of select="$charLt"/>%@ include file="/jsp/include/rmGlobal.jsp" %>
<xsl:value-of select="$charLt"/>meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<xsl:value-of select="$charLt"/>title><xsl:value-of select="$charLt"/>bean:message key="qb.web_title"/><xsl:value-of select="$charLt"/>/title>
<xsl:value-of select="$charLt"/>script type="text/javascript">
    function deleteMulti_onClick(){  //从多选框物理删除多条记录
        var ids = findSelections("checkbox_template","id");  //取得多选框的选择项
        if(ids == null) {  //如果ids为空
            alert("请选择记录!")
            return false;
        }
        if(!confirm("是否彻底删除该数据？")) {  //如果用户在确认对话框按"确定"
            return false;
        }
        form.user_ids.value = ids;
        form.action="<xsl:value-of select="$charLt"/>%=request.getContextPath()%>/<xsl:value-of select="@tableDirName"/>/deleteRm_m_message_user";
        form.submit();
    }
    function add_onClick() {  //到增加记录页面
        var inputValueName = new Object();
        getReference(new Array(form.user_ids, inputValueName), '<xsl:value-of select="$charLt"/>%=request.getContextPath()%>/', '<xsl:value-of select="$charLt"/>%=request.getContextPath()%>/RmUserAction.do?cmd=queryReference<xsl:value-of select="$charAmp"/>referenceInputType=checkbox');
        if(form.user_ids.value != "") {
            form.action="<xsl:value-of select="$charLt"/>%=request.getContextPath()%>/<xsl:value-of select="@tableDirName"/>/insertRm_m_message_user";
            form.submit();
        }
    }
    function refresh_onClick() {  //刷新本页
        form.submit();
    }
<xsl:value-of select="$charLt"/>/script>
<xsl:value-of select="$charLt"/>/head>
<xsl:value-of select="$charLt"/>body>
<xsl:value-of select="$charLt"/>form name="form" method="post">

<xsl:value-of select="$charLt"/>table class="tableHeader">
  <xsl:value-of select="$charLt"/>tr>
    <xsl:value-of select="$charLt"/>td width="1%"><xsl:value-of select="$charLt"/>img src="<xsl:value-of select="$charLt"/>%=request.getContextPath()%>/images/bg_mcontentL.gif" /><xsl:value-of select="$charLt"/>/td>
    <xsl:value-of select="$charLt"/>td class="tableHeaderMiddleTd"><xsl:value-of select="$charLt"/>b>关联用户列表<xsl:value-of select="$charLt"/>/b><xsl:value-of select="$charLt"/>/td>
    <xsl:value-of select="$charLt"/>td class="tableHeaderMiddleTd" width="60%" align="right">
        <xsl:value-of select="$charLt"/>input type="button" class="button_ellipse" id="button_add" value="新增" onclick="javascript:add_onClick();" title="新增关联的用户"/>
        <xsl:value-of select="$charLt"/>input type="button" class="button_ellipse" id="button_deleteMulti" value="删除" onclickto="javascript:deleteMulti_onClick();" title="删除所选的记录"/>
        <xsl:value-of select="$charLt"/>input type="button" class="button_ellipse" id="button_refresh" value="刷新" onclickto="javascript:refresh_onClick();" title="刷新当前页面"/>
    <xsl:value-of select="$charLt"/>/td>
    <xsl:value-of select="$charLt"/>td width="1%" align="right"><xsl:value-of select="$charLt"/>img src="<xsl:value-of select="$charLt"/>%=request.getContextPath()%>/images/bg_mcontentR.gif" /><xsl:value-of select="$charLt"/>/td>
  <xsl:value-of select="$charLt"/>/tr>
<xsl:value-of select="$charLt"/>/table>

<xsl:value-of select="$charLt"/>layout:collection name="beans" id="rmBean" styleClass="listCss" width="100%" indexId="rmOrderNumber" align="center" sortAction="0">
    <xsl:value-of select="$charLt"/>layout:collectionItem width="1%" title="<xsl:value-of select="$charLt"/>input type='checkbox' pdType='control' control='checkbox_template'/>" style="text-align:center;">
        <xsl:value-of select="$charLt"/>bean:define id="rmValue" name="rmBean" property="user_id"/>
        <xsl:value-of select="$charLt"/>input type="checkbox" name="checkbox_template" value="<xsl:value-of select="$charLt"/>%=rmValue%>"/>
    <xsl:value-of select="$charLt"/>/layout:collectionItem>
    <xsl:value-of select="$charLt"/>layout:collectionItem width="3%"  title="序" style="text-align:center;">
    <xsl:value-of select="$charLt"/>%
        Integer rmOrderNumber = (Integer)pageContext.getAttribute("rmOrderNumber");
        RmPageVo pageVo = (RmPageVo)pageContext.getRequest().getAttribute(IGlobalConstants.RM_PAGE_VO);
        out.print((pageVo.getCurrentPage() - 1) * pageVo.getPageSize() + rmOrderNumber.intValue() + 1);
    %>
        <xsl:value-of select="$charLt"/>bean:define id="rmValue" name="rmBean" property="user_id"/>
        <xsl:value-of select="$charLt"/>input type="hidden" signName="hiddenId" value="<xsl:value-of select="$charLt"/>%=rmValue%>"/>
    <xsl:value-of select="$charLt"/>/layout:collectionItem>
    <xsl:value-of select="$charLt"/>layout:collectionItem width="8%" title="名称">
        <xsl:value-of select="$charLt"/>bean:define id="rmValue" name="rmBean" property="rm_display_column"/>
        <xsl:value-of select="$charLt"/>bean:define id="user_id" name="rmBean" property="user_id"/>
        <xsl:value-of select="$charLt"/>%="<xsl:value-of select="$charLt"/>a class='aul' target='_blank' href='" + request.getContextPath() + "/RmUserReadOnlyAction.do?cmd=detail<xsl:value-of select="$charAmp"/>id=" + user_id + "<xsl:value-of select="$charAmp"/>" + IGlobalConstants.REQUEST_IS_READ_ONLY +  "=1'>"%>
        <xsl:value-of select="$charLt"/>%=rmValue%>
        <xsl:value-of select="$charLt"/>%="<xsl:value-of select="$charLt"/>/a>"%>
    <xsl:value-of select="$charLt"/>/layout:collectionItem>
<xsl:value-of select="$charLt"/>/layout:collection>
<xsl:value-of select="$charLt"/>jsp:include page="/jsp/include/page.jsp" />
<xsl:value-of select="$charLt"/>input type="hidden" name="message_id" value="<xsl:value-of select="$charLt"/>%=message_id%>">
<xsl:value-of select="$charLt"/>input type="hidden" name="user_ids" value="">
<xsl:value-of select="$charLt"/>/form>
<xsl:value-of select="$charLt"/>/body>
<xsl:value-of select="$charLt"/>/html>
    </xsl:result-document>
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>