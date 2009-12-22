<?xml version="1.0" encoding="UTF-8"?>
<!-- EAD Cookbook Stylesheet 3    Version 0.9   2000 July 22  -->
<!-- recent tuneup by Leslie Myrick 2002 08 August -->
<!-- modification of the stylesheet in order to comply with ead version 2002
    2002/03/15 and some clean-up of the code by sp 2003-03-15 -->
    <!-- stylesheet produces the whole finding aid in one file, no frames, 2004-09-09 by sp -->
    <!-- all styling instructions are in cascading stylesheet ead05.css -->   
    <!-- all the earlier edits and commented templates were deleted in the 05 generation of the stylesheet   -->
    <!--
        <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:saxon="http://icl.com/saxon"
        extension-element-prefixes="saxon" version="1.0">
        <xsl:output method="xml" doctype-system="www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="UTF-8" />
        <xsl:strip-space elements="*" />
        <xsl:param name="docdir">c:\workshop\documents\</xsl:param>
    -->
    
    <xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
        xmlns:ead="urn:isbn:1-931666-22-9"
        xmlns:ns2="http://www.w3.org/1999/xlink">
        
        <xsl:output indent="yes" method="xhtml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" encoding="utf-8"/>
        <xsl:include href="reports/Resources/eadToPdf/lookupLists.xsl"/>
        
        <xsl:strip-space elements="*" />
        <!--<xsl:include href="ajhs_replace.xsl"/>-->
        
        <xsl:variable name="summary-title">
            <xsl:choose>
                <xsl:when test="ead:ead/ead:archdesc/ead:did/ead:head"><xsl:apply-templates/></xsl:when>
                <xsl:otherwise>
                    Descriptive Summary
                </xsl:otherwise>
            </xsl:choose>               
        </xsl:variable>
        
        <xsl:template match="/">
            
            
            <xsl:call-template name="body"/>
            
        </xsl:template>
        
        
        <!-- tady Creates the body of the finding aid. -->
        <xsl:template name="body">
            <html>
                <head>
                    <style type="text/css">
                        .caption {font: 63% Georgia; width: 140px; margin: 0.5em; text-align: left;}
                        img[alt] {font-size: 70%; font-weight: normal;}
                    </style>
                    <link rel="stylesheet" type="text/css" href="http://digital.cjh.org/css/ead05.css"/>
                    <link rel="stylesheet" type="text/css" href="http://digital.cjh.org/css/print05.css" media="print"/>
                    <!-- for MEDITOR  insert this absolute path before the css file name -->
                    <!-- http://digital.cjh.org/ead05.css  -->
                    
                    <title>
                        <xsl:value-of select="ead:ead/ead:eadheader/ead:filedesc/ead:titlestmt"/>
                    </title>
                    
                    <xsl:element name="meta">
                        <xsl:attribute name="name">dc.title</xsl:attribute>
                        <xsl:attribute name="content">
                            <xsl:value-of select="ead:ead/ead:eadheader/ead:filedesc/ead:titlestmt/ead:titleproper"/>
                            <xsl:text>  </xsl:text>
                            <xsl:value-of select="ead:ead/ead:eadheader/ead:filedesc/ead:titlestmt/ead:subtitle"/>
                        </xsl:attribute>
                    </xsl:element>
                    
                    <xsl:element name="meta">
                        <xsl:attribute name="name">dc.author</xsl:attribute>
                        <xsl:attribute name="content">
                            <xsl:value-of select="ead:ead/ead:archdesc/ead:did/ead:origination"/>
                        </xsl:attribute>
                    </xsl:element>
                    
                    <xsl:for-each select="ead:ead//ead:controlaccess//ead:persname | ead:ead//ead:controlaccess//ead:corpname |
                        ead:ead//ead:controlaccess//ead:famname"> 
                        <xsl:choose>
                            
                            <!-- b01 edit - expand '600' -->
                            <xsl:when test="@encodinganalog='600$a'"> 
                                <!-- End b01 edit -->
                                
                                <xsl:element name="meta">
                                    <xsl:attribute name="name">dc.subject</xsl:attribute>
                                    <xsl:attribute name="content">
                                        <xsl:value-of select="."/>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:when>
                            
                            <!-- b01 edit - additional '600' -->
                            <xsl:when test="@encodinganalog='60030$a'"> 
                                <xsl:element name="meta">
                                    <xsl:attribute name="name">dc.subject</xsl:attribute>
                                    <xsl:attribute name="content">
                                        <xsl:value-of select="."/>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:when>
                            <!-- End b01 edit -->
                            
                            <!-- b01 edit - expand '610' -->
                            <xsl:when test="@encodinganalog='610$a'"> 
                                <!-- End b01 edit -->
                                
                                <xsl:element name="meta">
                                    <xsl:attribute name="name">dc.subject</xsl:attribute>
                                    <xsl:attribute name="content">
                                        <xsl:value-of select="."/>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:when>
                            
                            <xsl:when test="@encodinganalog='611'"> 
                                <xsl:element name="meta">
                                    <xsl:attribute name="name">dc.subject</xsl:attribute>
                                    <xsl:attribute name="content">
                                        <xsl:value-of select="."/>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:when>
                            
                            <!-- b01 - dc.contributor doesn't seem right for these... -->
                            
                            <xsl:when test="@encodinganalog='700'"> 
                                <xsl:element name="meta">
                                    <xsl:attribute name="name">dc.contributor</xsl:attribute>
                                    <xsl:attribute name="content">
                                        <xsl:value-of select="."/>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:when>
                            
                            
                            <xsl:when test="@encodinganalog='710'"> 
                                <xsl:element name="meta">
                                    <xsl:attribute name="name">dc.contributor</xsl:attribute>
                                    <xsl:attribute name="content">
                                        <xsl:value-of select="."/>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:when>
                            
                            <xsl:otherwise>
                                <xsl:element name="meta">
                                    <xsl:attribute name="name">dc.contributor</xsl:attribute>
                                    <xsl:attribute name="content">
                                        <xsl:value-of select="."/>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    
                    <xsl:for-each select="ead:ead//ead:controlaccess//ead:subject">
                        <xsl:element name="meta">
                            <xsl:attribute name="name">dc.subject</xsl:attribute>
                            <xsl:attribute name="content">
                                <xsl:value-of select="."/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:for-each>
                    
                    <xsl:element name="meta">
                        <xsl:attribute name="name">dc.title</xsl:attribute>
                        <xsl:attribute name="content">
                            <xsl:value-of select="ead:ead/ead:archdesc/ead:did/ead:unittitle"/>
                        </xsl:attribute>
                    </xsl:element>
                    
                    <xsl:element name="meta">
                        <xsl:attribute name="name">dc.type</xsl:attribute>
                        <xsl:attribute name="content">text</xsl:attribute>
                    </xsl:element>
                    
                    <xsl:element name="meta">
                        <xsl:attribute name="name">dc.format</xsl:attribute>
                        <xsl:attribute name="content">manuscripts</xsl:attribute>
                    </xsl:element>
                    
                    <xsl:element name="meta">
                        <xsl:attribute name="name">dc.format</xsl:attribute>
                        <xsl:attribute name="content">finding aids</xsl:attribute>
                    </xsl:element>
                    
                    <xsl:for-each select="ead:ead//ead:controlaccess//ead:geogname">
                        <xsl:element name="meta">
                            <xsl:attribute name="name">dc.coverage</xsl:attribute>
                            <xsl:attribute name="content">
                                <xsl:value-of select="."/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:for-each>
                </head>
                
                <body>
                    <div id="content">
                        <div id="leftcolumn">
                            <div id="navig">
                                <h4 class="head">finding aid navigation</h4>
                                <!-- A series of tests determine which elements will be included in the table of contents -->
                                <xsl:if test="ead:ead/ead:archdesc/ead:did">
                                    <a class="first" href="#a1" title="short summary of the collection">
                                        <xsl:copy-of select="$summary-title"/>
                                    </a>
                                </xsl:if>
                                <xsl:if test="ead:ead/ead:archdesc/ead:bioghist[string-length(text()|*)!=0]">
                                    <a href="#a2" title="short biographical or historical sketch">
                                        <xsl:value-of select="ead:ead/ead:archdesc/ead:bioghist/ead:head"/>
                                    </a>
                                </xsl:if>
                                <xsl:if test="ead:ead/ead:archdesc/ead:scopecontent[string-length(text()|*)!=0]">
                                    <a href="#a3" title="the researh value of the collection and its highlights">
                                        <xsl:value-of select="ead:ead/ead:archdesc/ead:scopecontent/ead:head"/>
                                    </a>
                                </xsl:if>
                                <xsl:if test="ead:ead/ead:archdesc/ead:arrangement[string-length(text()|*)!=0]">
                                    <a href="#a4" title="the structure of the collection">
                                        <xsl:value-of select="ead:ead/ead:archdesc/ead:arrangement/ead:head"/>
                                    </a>
                                </xsl:if>
                                <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:relatedmaterial[string-length(text()|*)!=0]">
                                    <a href="#a6" title="material that can be of use to researcher">
                                        <xsl:value-of select="ead:ead/ead:archdesc/ead:descgrp/ead:relatedmaterial/ead:head"/>
                                    </a>
                                </xsl:if>
                                <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:separatedmaterial[string-length(text()|*)!=0]">
                                    <a href="#a7" title="material that is associated with the collection, but was removed">
                                        <xsl:value-of select="ead:ead/ead:archdesc/ead:descgrp/ead:separatedmaterial/ead:head"/>
                                    </a>
                                </xsl:if>
                                <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:otherfindaid[string-length(text()|*)!=0]">
                                    <a href="#a8" title="other finding aids or inventories available">
                                        <xsl:value-of select="ead:ead/ead:archdesc/ead:descgrp/ead:otherfindaid/ead:head"/>
                                    </a>
                                </xsl:if>
                                <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:index[string-length(text()|*)!=0]">
                                    <a href="#a9" title="index">
                                        <xsl:value-of select="ead:ead/ead:archdesc/ead:descgrp/ead:index/ead:head"/>
                                    </a>
                                </xsl:if>
                                <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:bibliography[string-length(text()|*)!=0]">
                                    <a href="#a10" title="bibliography">
                                        <xsl:value-of select="ead:ead/ead:archdesc/ead:descgrp/ead:bibliography/ead:head"/>
                                    </a>
                                </xsl:if>
                                <xsl:if test="ead:ead/ead:archdesc/ead:odd[string-length(text()|*)!=0]">
                                    <a href="#a11" title="other descriptive data">
                                        <xsl:value-of select="ead:ead/ead:archdesc/ead:odd/ead:head"/>
                                    </a>
                                </xsl:if>
                                <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:userestrict[string-length(text()|*)!=0] | ead/archdesc/descgrp/accessrestrict[string-length(text()|*)!=0]">
                                    <a href="#a14" title="restrictions on access and use">
                                        <xsl:text>Restrictions</xsl:text>
                                    </a>
                                </xsl:if>
                                
                                <!-- removed 2004-09-08 individual elements will have their own anchers -->
                                <!--
                                    <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:acqinfo[string-length(text()|*)!=0] | ead/archdesc/descgrp/processinfo[string-length(text()|*)!=0] |  ead/archdesc/descgrp/prefercite[string-length(text()|*)!=0] | ead/archdesc/descgrp/custodialhist[string-length(text()|*)!=0] | ead/archdesc/descgrp/altformavail | ead/archdesc/descgrp/appraisal | ead/archdesc/descgrp/accruals[string-length(text()|*)!=0]">
                                    <a href="#a13"> Administrative Information</a>
                                    </xsl:if>
                                -->
                                <!-- end -->
                                
                                <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:custodhist[string-length(text()|*)!=0]">
                                    <a href="#a16" title="information about the chain of ownership">
                                        <xsl:value-of select="ead:ead/ead:archdesc/ead:descgrp/ead:custodhist/ead:head"/>
                                    </a>
                                </xsl:if>
                                <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:altformavail[string-length(text()|*)!=0]">
                                    <a href="#a17" title="material from the collection available in other form">
                                        <xsl:value-of select="ead:ead/ead:archdesc/ead:descgrp/ead:altformavail/ead:head"/>
                                    </a>
                                </xsl:if>
                                <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:prefercite[string-length(text()|*)!=0]">
                                    <a href="#a18" title="preferred citation">
                                        <xsl:value-of select="ead:ead/ead:archdesc/ead:descgrp/ead:prefercite/ead:head"/>
                                    </a>
                                </xsl:if>
                                <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:acqinfo[string-length(text()|*)!=0]">
                                    <a href="#a19" title="acquisition information">
                                        <xsl:value-of select="ead:ead/ead:archdesc/ead:descgrp/ead:acqinfo/ead:head"/>
                                    </a>
                                </xsl:if>
                                <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:processinfo[string-length(text()|*)!=0]">
                                    <a href="#a20" title="information about the steps taken when processing the collection">
                                        <xsl:value-of select="ead:ead/ead:archdesc/ead:descgrp/ead:processinfo/ead:head"/>
                                    </a>
                                </xsl:if>
                                <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:appraisal[string-length(text()|*)!=0]">
                                    <a href="#a21" title="appraisal">
                                        <xsl:value-of select="ead:ead/ead:archdesc/ead:descgrp/ead:appraisal/ead:head"/>
                                    </a>
                                </xsl:if>
                                <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:accruals[string-length(text()|*)!=0]">
                                    <a href="#a22" title="information about anticipated additions">
                                        <xsl:value-of select="ead:ead/ead:archdesc/ead:descgrp/ead:accruals/ead:head"/>
                                    </a>
                                </xsl:if>
                                <xsl:if test="ead:ead/ead:archdesc/ead:controlaccess[string-length(text()|*)!=0]">
                                    <a href="#a12" title="designates the key access points: subject headings, the most prominent persons or organizations inthe collection">
                                        <xsl:value-of select="ead:ead/ead:archdesc/ead:controlaccess/ead:head"/>
                                    </a>
                                </xsl:if>
                                
                                <div id="navigseries">
                                    
                                    <xsl:if test="ead:ead/ead:archdesc/ead:dsc[string-length(text()|*)!=0]">
                                        <h4 class="dsc">
                                            <a href="#a23"> 
                                                <xsl:value-of select="ead:ead/ead:archdesc/ead:dsc/ead:head"/>
                                            </a>
                                        </h4>
                                        
                                        <xsl:for-each select="ead:ead/ead:archdesc/ead:dsc/ead:c01">
                                            <a href="#{@id}">
                                                <!--<xsl:attribute name="href">
                                                    <xsl:text>#series</xsl:text>
                                                    <xsl:number format="1"/>
                                                    </xsl:attribute>-->
                                                <xsl:value-of select="ead:did/ead:unittitle"/>,&#x00A0;
                                                <xsl:value-of select="ead:did/ead:unitdate"/>
                                            </a>
                                        </xsl:for-each>
                                    </xsl:if>
                                </div>
                            </div>
                            
                            <div id="validation">
                                <a href="http://validator.w3.org/check?uri=referer">
                                    <img border="0" src="http://www.w3.org/Icons/valid-html40"
                                        alt="Valid HTML 4.0!" height="31" width="88" /></a>
                                <a href="http://jigsaw.w3.org/css-validator/check/referer">
                                    <img style="border:0;width:88px;height:31px"
                                        src="http://jigsaw.w3.org/css-validator/images/vcss" 
                                        alt="Valid CSS!" /></a>
                            </div>
                            <div class="comments">
                                If you have any comments, corrections, or suggestions, please contact us at:
                                <a href="mailto:archives@hadassah.org" title="email to archives at hadassah dot org">archives@hadassah.org</a>
                            </div>
                        </div>
                        
                        <div id="main">
                            <xsl:call-template name="eadheader"/>
                            <xsl:call-template name="archdesc-did"/>
                            <xsl:call-template name="archdesc-bioghist"/>
                            <xsl:call-template name="archdesc-scopecontent"/>
                            <xsl:call-template name="archdesc-arrangement"/>
                            <xsl:call-template name="archdesc-restrict"/>
                            <xsl:call-template name="archdesc-relatedmaterial"/>
                            <xsl:call-template name="archdesc-separatedmaterial"/>
                            <xsl:call-template name="archdesc-otherfindaid"/>
                            <xsl:call-template name="archdesc-descgrp"/>
                            <xsl:call-template name="archdesc-note"/>
                            <xsl:call-template name="archdesc-index"/>
                            <xsl:call-template name="archdesc-bibliography"/>
                            <xsl:call-template name="archdesc-odd"/>
                            <xsl:call-template name="archdesc-control"/>
                            <xsl:call-template name="dsc"/>         
                        </div>
                    </div>
                </body>
            </html>
        </xsl:template>
        
        <xsl:template match="ead:ead/ead:eadheader/ead:filedesc/ead:titlestmt/ead:titleproper">
            <xsl:value-of select="text()"/><br/><xsl:value-of select="ead:num"/>
        </xsl:template>
        
        <xsl:template name="eadheader">
            <div id="titlepage">
                <div id="logo">
                    <a href="http://www.hadassah.org/" title="External link to: Hadassah" target="_blank">
                        <img id="a0" class="frontdesign" src="http://images.hadassah.org/hadassah_logo118.jpg"  alt=" Hadassah logo" title="External link to: Hadassah"></img></a>
                </div>
                
                <xsl:for-each select="ead:ead/ead:eadheader/ead:filedesc/ead:titlestmt">
                    <h1><xsl:apply-templates select="ead:titleproper"/></h1>
                    <h2><xsl:value-of select="ead:subtitle"/></h2>
                    <h3><xsl:value-of select="ead:author"/></h3>
                    <h4><xsl:value-of select="ead:sponsor"/></h4>
                </xsl:for-each>
                
                <xsl:for-each select="ead:ead/ead:eadheader/ead:filedesc/ead:publicationstmt">
                    <!--<div id="address">
                        <xsl:for-each select="address/addressline">
                        <h4>
                        <xsl:apply-templates/>
                        </h4>
                        </xsl:for-each>
                        </div>-->
                    <!-- 20090120 stp -->
                    <div id="address">
                        <h4>Hadassah Archives at the</h4>
                        <h4>American Jewish Historical Society</h4>
                        <h4>Center for Jewish History</h4>
                        <h4>15 West 16<sup>th</sup> Street</h4>
                        <h4>New York, N.Y. 10011</h4>
                        <h4>Phone: (917) 606-8259</h4>
                        <h4>Fax: (212) 294-6161</h4>
                        <h4>Email: <a href="mailto:archives@hadassah.org?subject=Hadassah%20Finding%20Aid" title="email archives at hadassah dot org">archives@hadassah.org</a></h4>
                        <h4>URL: <a href="http://www.hadassah.org" title="Website of the Amnerican Jewish Historical Society">http://www.hadassah.org</a></h4>
                    </div>
                    <h5><xsl:value-of select="ead:p"/></h5>
                    <xsl:choose>
                        <xsl:when test="ead:date">
                            <h5>&#169; <xsl:value-of select="ead:date"/>&#xA0;
                                <xsl:value-of select="ead:publisher"/></h5> 
                        </xsl:when>
                        <xsl:otherwise>
                            <h5><xsl:value-of select="ead:publisher"/></h5>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                </xsl:for-each>
                
                <xsl:for-each select="ead:ead/eadheader">
                    <h5><xsl:value-of select="ead:profiledesc"/></h5>
                    <h5><xsl:value-of select="ead:revisiondesc"/></h5>
                </xsl:for-each>
            </div>
            <hr />
        </xsl:template>
        
        <!-- b01 edit - process lb element -->
        <!-- many approaches tried - I believe this is the one that worked -->
        <xsl:template match="lb">
            <br />
        </xsl:template>
        
        <xsl:template match="*[@audience='internal']">
            
        </xsl:template>
        <!-- End b01 edit -->
        
        <!-- The following templates format the display of various RENDER attributes. -->
        <!-- 0807 edit don't need these really so I commented them out -->
        <!-- 
            <xsl:template match="*/title">
            <xsl:apply-templates/>
            </xsl:template>
            
            <xsl:template match="*/emph">
            <xsl:apply-templates/>
            </xsl:template>
        -->
        <!-- The following templates format the display of various RENDER attributes. -->
        
        <!--INNA's edition, added template for emph element, 11/28/2001-->
        <xsl:template match="*//emph">
            <xsl:choose>
                <xsl:when test="@render='italic'">
                    <em><xsl:apply-templates/></em>
                </xsl:when>
                <xsl:when test="@render='bold'">
                    <strong><xsl:apply-templates/></strong>
                </xsl:when>
                <xsl:when test="@render='bolditalic'">
                    <strong><em><xsl:apply-templates/></em></strong>
                </xsl:when>
                <xsl:when test="@render='super'">
                    <sup><xsl:apply-templates/></sup>
                </xsl:when>
                <xsl:when test="@render='sub'">
                    <sub><xsl:apply-templates/></sub>
                </xsl:when>
                <xsl:when test="@render='singlequote'">
                    &#x0027;<xsl:apply-templates/>&#x0027;
                </xsl:when>
                <xsl:when test="@render='doublequote'">
                    &#x0022;<xsl:apply-templates/>&#x0022;
                </xsl:when>
                <xsl:when test="@render='underline'">
                    <u><xsl:apply-templates/></u>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:template>
        
        <xsl:template match="//title">
            <xsl:choose>
                <xsl:when test="@render='italic'">
                    <em><xsl:apply-templates/></em>
                </xsl:when>
                <xsl:when test="@render='bold'">
                    <strong><xsl:apply-templates/></strong>
                </xsl:when>
                <xsl:when test="@render='bolditalic'">
                    <strong><em><xsl:apply-templates/></em></strong>
                </xsl:when>
                <xsl:when test="@render='super'">
                    <sup><xsl:apply-templates/></sup>
                </xsl:when>
                <xsl:when test="@render='sub'">
                    <sub><xsl:apply-templates/></sub>
                </xsl:when>
                <xsl:when test="@render='quoted'">
                    &#x201C;<xsl:apply-templates/>&#x201D;
                </xsl:when>
                <xsl:when test="@render='underline'">
                    <u><xsl:apply-templates/></u>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:template> 
        
        <!-- This template converts a Ref element into an HTML anchor. -->
        <!-- 
            xsl:template match="ead:ead/ead:archdesc/ead:/ead:ref">
            <xsl:variable name="target">
            <xsl:value-of select="@target"/>
            </xsl:variable>
            <a href="#{$target}">
            <xsl:value-of select="."/>
            </a>
            </xsl:template>
        -->
        
        <!-- extptr element added 2006-01-17 by sp -->
        <!-- extptr is to replace the earlier use of dao in
            bioghist  -->
        <xsl:template match="extptr">
            <div class="extptr_image">	
                <img src="{@xpointer | @href}" title="{@title}" alt="{@altrender}">
                    
                    <xsl:apply-templates/>
                </img>
                <p class="caption">
                    <xsl:value-of select="@title"/>
                </p>
            </div>
        </xsl:template>
        
        <xsl:template match="ref">
            <a href="#{@target}">
                <xsl:apply-templates/>
            </a>
        </xsl:template>
        
        <!-- This template converts a Extref element into an HTML link. -->
        <xsl:template match="extref">
            <xsl:choose>
                <xsl:when test="@show='new'">
                    <a href="{@href}" title="{@title}" target="_blank">
                        <xsl:apply-templates/>
                    </a>
                </xsl:when>
                <xsl:otherwise>
                    <a href="{@href}" title="{@title}">
                        <xsl:apply-templates/>
                    </a>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:template>
        
        <!-- This template adds a href to archref element -->
        <!-- added on 2005/05/11 by sp -->
        <xsl:template match="archref">
            <xsl:choose>
                <xsl:when test="@href">
                    <a href="{@href}" target="_blank">
                        <xsl:apply-templates/>
                    </a>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:template>
        
        <!-- Converts an ID attribute into the name attribute of an HTML anchor to form the target of a Ref element. -->
        
        <xsl:template match="*[@id]">
            <a id="{@id}">
                <xsl:value-of select="."/>
            </a>
        </xsl:template>
        
        <!--This template rule formats a list element. -->
        <!--Changed the original paragraph with indent for a 'real' list 2004/04 sp-->
        <!-- added code for attribute ordered list 2004/07/13, updated 2005/03/16 by sp-->
        <xsl:template match="list">
            <xsl:choose>
                <xsl:when test="@type='ordered'">
                    <ol>
                        <xsl:apply-templates />
                    </ol>
                </xsl:when>
                
                <xsl:otherwise>
                    <ul>
                        <xsl:apply-templates />
                    </ul>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:template>
        
        <xsl:template match="list/head">
            <li><h3>
                <xsl:apply-templates />
            </h3>
            </li>
        </xsl:template>
        
        <xsl:template match="item">
            <li>
                <xsl:apply-templates />
            </li>
        </xsl:template>
        
        <xsl:template match="scopecontent/list | separatedmaterial/list | relatedmaterial/list | controlaccess/list | bioghist/list" >
            <ul class="note">
                <xsl:apply-templates/>
            </ul>
        </xsl:template>
        <!-- end of edit -->
        
        
        
        <!--Formats a simple table. The width of each column is defined by the colwidth attribute in a colspec element. -->
        <!-- table rule modified on 2006-03-03 -->
        <xsl:template match="*/table">
            <xsl:for-each select="tgroup">
                <table width="60%">
                    <tr>
                        <xsl:for-each select="colspec">
                            <td width="{@colwidth}"></td>
                        </xsl:for-each>
                    </tr>
                    <xsl:for-each select="thead">
                        <xsl:for-each select="row">
                            <tr>
                                <xsl:for-each select="entry">
                                    <th>
                                        <xsl:value-of select="."/>
                                    </th>
                                </xsl:for-each>
                            </tr>
                        </xsl:for-each>
                    </xsl:for-each>
                    
                    <xsl:for-each select="tbody">
                        <xsl:for-each select="row">
                            <tr>
                                <xsl:for-each select="entry">
                                    <td><xsl:value-of select="."/></td>
                                </xsl:for-each>
                            </tr>
                        </xsl:for-each>
                    </xsl:for-each>
                </table>
            </xsl:for-each>
        </xsl:template>
        
        
        <!--This template rule formats the top-level did element. -->
        <xsl:template name="archdesc-did">
            <xsl:variable name="file">
                <xsl:value-of select="ead:ead/ead:eadheader/ead:eadid"/>
            </xsl:variable>
            
            <!--For each element of the did, this template inserts the value of the LABEL attribute or, if none is present, a default value. -->
            
            <xsl:for-each select="ead:ead/ead:archdesc/ead:did">
                <table class="summary">
                    <tr>
                        <td width="25%"></td>
                        <td width="75%"></td></tr>
                    <tr>
                        <td colspan="2">
                            <h3><a name="a1">
                                <xsl:copy-of select="$summary-title"/>
                                <!--
                                <xsl:choose>
                                    <xsl:when test="ead:head"><xsl:apply-templates/></xsl:when>
                                    <xsl:otherwise>
                                        Descriptive Summary
                                    </xsl:otherwise>
                                </xsl:choose>-->
                                </a></h3></td>
                    </tr>
                    
                    <xsl:for-each select="ead:origination">
                        <xsl:choose>
                            <xsl:when test="@label">
                                <tr>
                                    <th>
                                        <xsl:value-of select="@label"/><xsl:text>: </xsl:text>
                                    </th>
                                    <td><xsl:apply-templates select="."/></td>
                                </tr>
                            </xsl:when>
                            <xsl:otherwise>
                                <tr>
                                    <th><xsl:text>Creator:</xsl:text></th>
                                    <td><xsl:apply-templates select="."/></td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    
                    <xsl:for-each select="ead:unittitle">
                        <xsl:choose>
                            <xsl:when test="@label">
                                <tr>
                                    <th>
                                        <xsl:value-of select="@label"/><xsl:text>: </xsl:text>
                                    </th>
                                    <td><xsl:apply-templates select="text()"/></td>
                                </tr>
                            </xsl:when>
                            <xsl:otherwise>
                                <tr>
                                    <th><xsl:text>Title:</xsl:text></th>
                                    <td><xsl:apply-templates select="text()"/></td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    
                    <xsl:if test="unitdate">
                        <xsl:for-each select="unitdate[string-length(text()|*)!=0]">
                            <xsl:choose>
                                <xsl:when test="@label">
                                    <tr>
                                        <th><xsl:value-of select="@label"/><xsl:text>:</xsl:text></th>
                                        <td><xsl:apply-templates select="."/></td>
                                    </tr>
                                </xsl:when>
                                <xsl:otherwise>
                                    <tr>
                                        <th><xsl:text>Dates:</xsl:text></th>
                                        <td valign="top"><xsl:apply-templates select="."/>
                                        </td>
                                    </tr>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </xsl:if>
                    
                    <xsl:for-each select="ead:abstract">
                        <xsl:choose>
                            <xsl:when test="@label">
                                <tr>
                                    <th>
                                        <xsl:value-of select="@label"/><xsl:text>: </xsl:text>
                                    </th>
                                    <td><xsl:apply-templates/></td>
                                </tr>
                            </xsl:when>
                            <xsl:otherwise>
                                <tr>
                                    <th><xsl:text>Abstract:</xsl:text></th>
                                    <td><xsl:apply-templates/></td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    
                    <xsl:for-each select="ead:langmaterial">
                        <xsl:choose>
                            <xsl:when test="@label">
                                <tr>
                                    <th>
                                        <xsl:value-of select="@label"/><xsl:text>: </xsl:text>
                                    </th>
                                    <td><xsl:apply-templates select="."/></td>
                                </tr>
                            </xsl:when>
                            <xsl:otherwise>
                                <tr>
                                    <th><xsl:text>Language:</xsl:text></th>
                                    <td><xsl:apply-templates select="."/></td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    
                    <xsl:for-each select="ead:physdesc">
                        <xsl:choose>
                            <xsl:when test="@label">
                                <tr>
                                    <th>
                                        <xsl:value-of select="@label"/><xsl:text>: </xsl:text>
                                    </th>
                                    <td><xsl:apply-templates select="."/></td>
                                </tr>
                            </xsl:when>
                            <xsl:otherwise>
                                <tr>
                                    <th><xsl:text>Quantity:</xsl:text></th>
                                    <td><xsl:apply-templates select="."/></td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    
                    <xsl:for-each select="ead:unitid">
                        <xsl:choose>
                            <xsl:when test="@label">
                                <tr>
                                    <th>
                                        <xsl:value-of select="@label"/><xsl:text>: </xsl:text>
                                    </th>
                                    <td><xsl:apply-templates select="."/></td>
                                </tr>
                            </xsl:when>
                            <xsl:otherwise>
                                <tr>
                                    <th><xsl:text>Identification:</xsl:text></th>
                                    <td><xsl:apply-templates select="."/></td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    
                    <xsl:for-each select="ead:repository">
                        <xsl:choose>
                            <xsl:when test="@label">
                                <tr>
                                    <th>
                                        <xsl:value-of select="@label"/><xsl:text>: </xsl:text>
                                    </th>
                                    <td><xsl:apply-templates select="."/></td>
                                </tr>
                            </xsl:when>
                            <xsl:otherwise>
                                <tr>
                                    <th><xsl:text>Repository:</xsl:text></th>
                                    <td><xsl:apply-templates select="."/></td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    
                    <!-- b01 edit - turn physloc off -->
                    <!--
                        <xsl:if test="physloc[string-length(text()|*)!=0]">
                        <xsl:choose>
                        <xsl:when test="@label">
                        <tr>
                        <th><xsl:value-of select="@label"/></th>
                        <td><xsl:apply-templates select="physloc"/></td>
                        </tr>
                        </xsl:when>
                        
                        <xsl:otherwise>
                        <tr>
                        <th><xsl:text>Location: </xsl:text></th>
                        <td><xsl:apply-templates select="physloc"/></td>
                        </tr>
                        </xsl:otherwise>
                        </xsl:choose>
                        </xsl:if>
                    -->
                    <!-- End b01 edit -->
                    
                    <xsl:if test="ead:note[string-length(text()|*)!=0]">
                        <xsl:for-each select="ead:note">
                            <xsl:choose>
                                <xsl:when test="@label">
                                    <tr>
                                        <th><xsl:value-of select="@label"/><xsl:text>:</xsl:text></th>
                                        <td><xsl:for-each select="ead:p">
                                            <p><xsl:apply-templates/>
                                            </p>
                                        </xsl:for-each>
                                        </td>
                                    </tr>
                                </xsl:when>
                                
                                <xsl:otherwise>
                                    <tr>
                                        <th>
                                            <!-- b01 edit - chg Location to Note, wrap with xsl-colon-text -->
                                            <xsl:text>Note: </xsl:text></th>
                                        <td>
                                            <!-- End b01 edit -->
                                            <p>
                                                <xsl:for-each select="ead:p">
                                                    <xsl:apply-templates select="."/>
                                                </xsl:for-each>
                                            </p>
                                        </td>
                                    </tr>
                                </xsl:otherwise>
                                
                            </xsl:choose>
                        </xsl:for-each>
                    </xsl:if>
                </table>
                
                <!-- return link added 2004-09-09 by sp -->
                <a class="return" href="#a0">Return to the Top of Page</a>
                <hr />
                
            </xsl:for-each>
        </xsl:template>
        
        <!--This template rule formats the top-level bioghist element. -->
        <xsl:template name="archdesc-bioghist">
            <xsl:variable name="file">
                <xsl:value-of select="ead:ead/ead:eadheader/ead:eadid"/>
            </xsl:variable>
            
            <xsl:if test="ead:ead/ead:archdesc/ead:bioghist[string-length(text()|*)!=0]">
                <xsl:for-each select="ead:ead/ead:archdesc/ead:bioghist">
                    <xsl:apply-templates/>
                    
                    <!-- return link added 2004-09-09 by sp -->
                    <a class="return" href="#a0">Return to the Top of Page</a>
                    <hr />
                </xsl:for-each>
            </xsl:if>
        </xsl:template>
        
        <xsl:template match="ead:ead/ead:archdesc/ead:bioghist/ead:head">
            <h3><a name="a2">
                <xsl:apply-templates/>
            </a></h3>
        </xsl:template>
        
        <!-- dao added 2004/07/01 by sp -->
        <!--
            <xsl:template match="ead:ead/ead:archdesc/ead:bioghist/ead:p/ead:extptr">
            <div class="dao">
            
            <img src="{@xpointer | @href}" title="{@title}" alt="{@altrender}"/>
            <xsl:apply-templates select="ead:ead/ead:archdesc/ead:bioghist/ead:dao"/>
            
            <xsl:for-each select="daodesc">
            <h6 class="daocaption">
            <xsl:apply-templates select="."/>
            </h6>
            </xsl:for-each>
            </div>
            </xsl:template>
        -->
        
        <!-- end of the addition -->
        
        <xsl:template match="ead:ead/ead:archdesc/ead:bioghist/ead:blockquote/ead:p">
            <blockquote>
                <xsl:apply-templates/>
            </blockquote>
        </xsl:template>
        
        <xsl:template match="ead:ead/ead:archdesc/ead:bioghist/ead:p">
            <p class="note">
                <xsl:apply-templates/>
            </p>
        </xsl:template>
        
        
        <!-- 0807 edit  this is treated below -->
        <!--<xsl:template match="ead:ead/ead:archdesc/ead:bioghist/ead:chronlist">
            <xsl:apply-templates/>
            </xsl:template>-->
        
        <!-- h3 class added 2004/07/01 by sp -->
        <xsl:template match="ead:ead/ead:archdesc/ead:bioghist/ead:bioghist">
            <h3 class="subheading">
                <xsl:apply-templates select="ead:head"/>
            </h3>
            
            <!-- dao added 2004/07/01 by sp -->
            <xsl:if test="dao">  
                <div class="dao">
                    <xsl:for-each select="dao">
                        <img src="{@xpointer | @href}" title="{@title}" alt="{@altrender}"/>
                        <xsl:apply-templates select="dao"/>
                    </xsl:for-each>
                    <xsl:for-each select="dao/daodesc/p">
                        <h6 class="daocaption">
                            <xsl:apply-templates/>
                        </h6>
                    </xsl:for-each>
                </div>
            </xsl:if>
            
            <!-- end of dao edit -->
            
            <xsl:for-each select="ead:p">
                <p class="note">
                    <xsl:apply-templates select="."/>
                </p>
            </xsl:for-each>
            
            <xsl:for-each select="ead:blockquote/p">
                <blockquote>
                    <xsl:apply-templates select="."/>
                </blockquote>
            </xsl:for-each>
            
        </xsl:template>
        
        <!--This template rule formats a chronlist element. -->
        <!-- style information for the head and the rest of the chronlist modified 2003-07-21 by sp -->
        <xsl:template match="*/chronlist">
            
            <!-- b03 edit - add padding -->
            <table class="chronlist">
                <!-- End b03 edit -->
                
                <tr>
                    <td width="25%"></td>
                    <td width="75%"></td>
                </tr>
                
                <xsl:for-each select="ead:head">
                    <tr><td colspan="2"><h4>
                        <xsl:apply-templates/>
                    </h4></td></tr>
                </xsl:for-each>
                
                <xsl:for-each select="ead:listhead">
                    <tr>
                        <td>
                            <xsl:apply-templates select="ead:head01"/>
                        </td>
                        <td>
                            <xsl:apply-templates select="ead:head02"/>
                        </td>
                    </tr>
                </xsl:for-each>
                
                <xsl:for-each select="ead:chronitem">
                    <tr>
                        <td>
                            <xsl:apply-templates select="ead:date"/>
                        </td>
                        <td>
                            
                            <!-- b03 edit - add eventgrp -->
                            <!--
                                <xsl:apply-templates select="event"/>
                            -->
                            <xsl:for-each select="ead:event | ead:eventgrp/ead:event">
                                <xsl:apply-templates/>
                            </xsl:for-each>
                            <!-- End b03 edit -->
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
        </xsl:template>
        
        <!--This template rule formats the scopecontent element. -->
        <xsl:template name="archdesc-scopecontent">
            <xsl:if test="ead:ead/ead:archdesc/ead:scopecontent[string-length(text()|*)!=0]">
                <xsl:for-each select="ead:ead/ead:archdesc/ead:scopecontent"> 
                    <xsl:apply-templates/>
                </xsl:for-each>
            </xsl:if>
            <!-- return link added 2004-09-09 by sp -->
            <a class="return" href="#a0">Return to the Top of Page</a>
            <hr />
        </xsl:template>
        
        <xsl:template match="ead:ead/ead:archdesc/ead:scopecontent/ead:head">
            <h3><a name="a3">
                <xsl:apply-templates/>
            </a></h3>
        </xsl:template>
        
        <!-- This formats an arrangement list (organization element)embedded in a scope content statement. -->
        <!-- the paragraph format was exchanged for the html list formating by sp 2004/05/04 -->  
        <xsl:template match="ead:ead/ead:archdesc/ead:scopecontent/ead:arrangement">
            <xsl:for-each select="ead:p">
                <p class="arrangement">
                    <xsl:apply-templates/>
                </p>
            </xsl:for-each>
            
            <xsl:for-each select="ead:list">
                <ul class="arrangement">
                    <xsl:for-each select="ead:head">
                        <li class="head">
                            <apply-templates select="ead:head"/>
                            <xsl:apply-templates select="."/>
                        </li>
                    </xsl:for-each>
                    <xsl:for-each select="ead:item">
                        <li>
                            <!--<a><xsl:attribute name="href">#series<xsl:number/>
                                </xsl:attribute>-->
                            <xsl:apply-templates select="."/>
                            <!--</a>-->
                        </li>
                    </xsl:for-each>
                </ul>
            </xsl:for-each>
        </xsl:template>
        
        <xsl:template match="ead:ead/ead:archdesc/ead:scopecontent/ead:p">
            <p class="note">
                <xsl:apply-templates/>
            </p>
        </xsl:template>
        
        <!--This template rule formats the arrangement element on the collection level. -->
        <!-- the table was deleted and paragraph structure of the list was substituted with the regular list by sp 2004/04/16, modified 2005/03/29 -->
        <xsl:template name="archdesc-arrangement">
            <xsl:if test="ead:ead/ead:archdesc/ead:arrangement[string-length(text()|*)!=0]">
                <xsl:for-each select="ead:ead/ead:archdesc/ead:arrangement">
                    <h3>
                        <a name="a4">
                            <xsl:apply-templates select="ead:head"/>
                        </a>
                    </h3>
                    <xsl:for-each select="ead:arrangement/ead:p">
                        <xsl:apply-templates select="."/>
                    </xsl:for-each>
                    
                    <xsl:for-each select="ead:p">
                        <p class="note">
                            <xsl:apply-templates select="."/>
                        </p>
                    </xsl:for-each>
                    
                    <xsl:for-each select="ead:list">
                        <ul class="arrangement">
                            <xsl:for-each select="ead:list/ead:head">
                                <xsl:apply-templates select="ead:list/ead:head"/>
                            </xsl:for-each>
                            <xsl:for-each select="ead:item">
                                <li>
                                    <!--<a><xsl:attribute name="href">#series<xsl:number/>
                                        </xsl:attribute>-->
                                    <xsl:apply-templates/>
                                    <!--</a>-->
                                </li>
                            </xsl:for-each>
                            
                        </ul>
                    </xsl:for-each>
                </xsl:for-each>
                <!-- return link added 2004-09-09 by sp -->
                <a class="return" href="#a0">Return to the Top of Page</a>
                <hr />
                
            </xsl:if>
        </xsl:template>
        
        <!--
            <xsl:for-each select="list">
            <tr><td> </td><td colspan="2">
            <xsl:apply-templates select="ead:head"/>
            </td></tr>
            <xsl:for-each select="item">
            <tr><td></td><td></td><td colspan="1">
            <a><xsl:attribute name="href">#series<xsl:number/>
            </xsl:attribute>
            <xsl:apply-templates select="."/>
            </a>
            </td></tr>
            </xsl:for-each>
            </xsl:for-each>
            </table>
            </xsl:for-each>
            <p>
            </p>
            </xsl:if>
            </xsl:template>
        -->
        
        <!--This template rule formats the top-level relatedmaterial element. -->
        <xsl:template name="archdesc-relatedmaterial">
            <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:relatedmaterial[string-length(text()|*)!=0]">
                <h3><a name="a6">
                    <xsl:apply-templates select="ead:ead/ead:archdesc/ead:descgrp/ead:relatedmaterial/ead:head"/></a>
                </h3>
                <xsl:for-each select="ead:ead/ead:archdesc/ead:descgrp/ead:relatedmaterial">
                    <xsl:apply-templates select="*[not(self::head)]"/> 
                </xsl:for-each>
                
                <!-- return link added 2004-09-09 by sp -->
                <a class="return" href="#a0">Return to the Top of Page</a>
                <hr />
                
            </xsl:if>
        </xsl:template>
        
        <xsl:template match="ead:ead/ead:archdesc/ead:descgrp/ead:relatedmaterial/ead:p">
            <p class="note">
                <xsl:apply-templates/>
            </p>
        </xsl:template>
        
        <!--This template rule formats the top-level separatedmaterial element. -->
        
        <xsl:template name="archdesc-separatedmaterial">
            <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:separatedmaterial">
                <h3><a name="a7">
                    <xsl:apply-templates select="ead:ead/ead:archdesc/ead:descgrp/ead:separatedmaterial/ead:head"/></a></h3>
                <xsl:for-each select="ead:ead/ead:archdesc/ead:descgrp/ead:separatedmaterial">
                    <xsl:apply-templates select="*[not(self::head)]"/> 
                </xsl:for-each>
                
                <!-- return link added 2004-09-09 by sp -->
                <a class="return" href="#a0">Return to the Top of Page</a>
                <hr />
                
            </xsl:if>
        </xsl:template>
        
        <xsl:template match="ead:ead/ead:archdesc/ead:descgrp/ead:separatedmaterial/ead:p">
            <p class="note">
                <xsl:apply-templates/>
            </p>
        </xsl:template>
        
        <!-- separatedmaterial/separatedmaterial section added on 2004/11/23 by sp -->
        <xsl:template match="ead:ead/ead:archdesc/ead:descgrp/ead:separatedmaterial/ead:separatedmaterial">
            <xsl:if test="ead:head">
                <h4><xsl:apply-templates select="ead:head"></xsl:apply-templates></h4>
            </xsl:if>
            <ul class="descgrp">
                <xsl:for-each select="ead:list">
                    <xsl:apply-templates select="ead:list" />
                    <xsl:for-each select="ead:item | ead:bibref">
                        <li>
                            <xsl:apply-templates select="." />
                        </li>
                    </xsl:for-each></xsl:for-each>
            </ul>
        </xsl:template>
        
        <!--This template rule formats the top-level otherfindaid element. -->
        <xsl:template name="archdesc-otherfindaid">
            <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:otherfindaid[string-length(text()|*)!=0]">
                <xsl:for-each select="ead:ead/ead:archdesc/ead:descgrp/ead:otherfindaid">
                    <h3><a name="a8">
                        <xsl:apply-templates select="ead:head"/>
                    </a></h3>
                    <xsl:for-each select="ead:p">
                        <p class="note">
                            <xsl:apply-templates select="."/>
                        </p>
                    </xsl:for-each>
                </xsl:for-each>
                
                <!-- return link added 2004-09-09 by sp -->
                <a class="return" href="#a0">Return to the Top of Page</a>
                <hr />
                
            </xsl:if>
        </xsl:template>
        
        <!-- added <note> to "archdesc" by sp 10/16/2003 -->
        <xsl:template name="archdesc-note">
            <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:note[string-length(text()|*)!=0]">
                <xsl:for-each select="ead:ead/ead:archdesc/ead:descgrp/ead:note">
                    <h3><xsl:apply-templates select="ead:head"/>
                    </h3>
                    <xsl:for-each select="ead:p">
                        <p class="note">
                            <xsl:apply-templates select="."/>
                        </p>
                    </xsl:for-each>
                </xsl:for-each>
                <!-- return link added 2004-09-09 by sp -->
                <a class="return" href="#a0">Return to the Top of Page</a>
                <hr />
            </xsl:if>
        </xsl:template>
        
        <!--This template rule formats the top-level index element. -->
        <!-- indexentry added to the index 2004/07/28 by sp -->
        <xsl:template name="archdesc-index">
            <xsl:if test="ead:ead/ead:archdesc/ead:index[string-length(text()|*)!=0]">
                <xsl:for-each select="ead:ead/ead:archdesc/ead:index">
                    <h3><a name="a9">
                        <xsl:apply-templates select="ead:head"/>
                    </a></h3>
                    <xsl:for-each select="ead:p">
                        <p class="note">
                            <xsl:apply-templates select="."/>
                        </p>
                    </xsl:for-each>
                    <xsl:if test="indexentry">
                        <ul class="note">
                            <xsl:for-each select="indexentry">
                                <li>
                                    <xsl:apply-templates select="title | name | persname | famname | indexentry"/>&#x00A0;
                                    <xsl:apply-templates select="ref | ptr"/>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </xsl:if>
                </xsl:for-each>
            </xsl:if>
            
            <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:index[string-length(text()|*)!=0]">
                <xsl:for-each select="ead:ead/ead:archdesc/ead:descgrp/ead:index">
                    <h3><a name="a9">
                        <xsl:apply-templates select="ead:head"/>
                    </a></h3>
                    <xsl:for-each select="ead:p">
                        <p class="note">
                            <xsl:apply-templates select="."/>
                        </p>
                    </xsl:for-each>
                    <xsl:if test="indexentry">
                        <ul class="note">
                            <xsl:for-each select="indexentry">
                                <li>
                                    <xsl:apply-templates select="title | name | persname | famname | indexentry"/>&#x00A0;
                                    <xsl:apply-templates select="ref | ptr"/>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </xsl:if>
                </xsl:for-each>
                <!-- return link added 2004-12-27 by sp -->
                <a class="return" href="#a0">Return to the Top of Page</a>
                <hr />
            </xsl:if>
            
            <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:index/ead:index[string-length(text()|*)!=0]">
                <xsl:for-each select="ead:ead/ead:archdesc/ead:descgrp/ead:index/ead:index">
                    <h4>
                        <xsl:apply-templates select="ead:head"/>
                    </h4>
                    <xsl:for-each select="ead:p">
                        <p class="note">
                            <xsl:apply-templates select="."/>
                        </p>
                    </xsl:for-each>
                    <xsl:if test="indexentry">
                        <ul class="note">
                            <xsl:for-each select="indexentry">
                                <li>
                                    <xsl:apply-templates select="title | name | persname | famname | indexentry"/>&#x00A0;
                                    <xsl:apply-templates select="ref | ptr"/>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </xsl:if>
                </xsl:for-each>
            </xsl:if>
        </xsl:template>
        <!--end of edit -->
        
        <!-- This template rule formats the top-level bibliography element. -->
        <!-- INNA's edit: supressed paragraph around each bibref. 12/04/2001 -->
        <!-- Stan's edit: created the ability to have a main bib head with mulitiple bibs. 2004-1-27 -->
        <xsl:template name="archdesc-bibliography">
            <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:bibliography[string-length(text()|*)!=0]">
                <xsl:for-each select="ead:ead/ead:archdesc/ead:descgrp/ead:bibliography">
                    <h3><a name="a10">
                        <xsl:apply-templates select="ead:head"/>
                    </a></h3>
                    <xsl:for-each select="ead:p">
                        <!-- xsl:for-each select="bibref" -->
                        <p class="note">
                            <xsl:apply-templates select="."/>
                        </p>
                        <!--</xsl:for-each>-->
                    </xsl:for-each>
                    <xsl:for-each select="ead:list">
                        <xsl:choose>
                            <xsl:when test="@type='ordered'">
                                <ol>
                                    <xsl:for-each select="ead:head">
                                        <li class="head">
                                            <xsl:apply-templates/>
                                        </li>
                                    </xsl:for-each>
                                    
                                    <xsl:for-each select="ead:item">
                                        <li>
                                            <xsl:apply-templates/>
                                        </li>
                                    </xsl:for-each>
                                </ol>
                            </xsl:when>
                            
                            <xsl:otherwise>
                                <ul class="note">
                                    <xsl:for-each select="ead:head">
                                        <li class="head">
                                            <xsl:apply-templates/>
                                        </li>
                                    </xsl:for-each>
                                    
                                    <xsl:for-each select="ead:item">
                                        <li>
                                            <xsl:apply-templates/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:for-each>
                <!-- return link added 2004-12-27 by sp -->
                <a class="return" href="#a0">Return to the Top of Page</a>
                <hr />
            </xsl:if>
            
            <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:bibliography/ead:bibliography[string-length(text()|*)!=0]">
                <xsl:for-each select="ead:ead/ead:archdesc/ead:descgrp/ead:bibliography/ead:bibliography">
                    <h4>
                        <xsl:apply-templates select="ead:head"/>
                    </h4>
                    <xsl:for-each select="ead:bibref">
                        <p class="note">
                            <xsl:apply-templates select="."/>
                        </p>
                    </xsl:for-each>
                    <xsl:for-each select="ead:list">
                        <xsl:choose>
                            <xsl:when test="@type='ordered'">
                                <ol>
                                    <xsl:for-each select="ead:head">
                                        <li class="head">
                                            <xsl:apply-templates/>
                                        </li>
                                    </xsl:for-each>
                                    
                                    <xsl:for-each select="ead:item">
                                        <li>
                                            <xsl:apply-templates/>
                                        </li>
                                    </xsl:for-each>
                                </ol>
                            </xsl:when>
                            
                            <xsl:otherwise>
                                <ul class="note">
                                    <xsl:for-each select="ead:head">
                                        <li class="head">
                                            <xsl:apply-templates/>
                                        </li>
                                    </xsl:for-each>
                                    
                                    <xsl:for-each select="ead:item">
                                        <li>
                                            <xsl:apply-templates/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:if>
        </xsl:template>
        
        <!--This template rule formats the top-level odd element. -->
        <xsl:template name="archdesc-odd">
            <xsl:if test="ead:ead/ead:archdesc/ead:odd[string-length(text()|*)!=0]">
                <xsl:for-each select="ead:ead/ead:archdesc/ead:odd">
                    <h3><a name="a11">
                        <xsl:apply-templates select="ead:head"/>
                    </a></h3>
                    <xsl:for-each select="ead:p">
                        <p class="note"> 
                            <xsl:apply-templates select="."/>
                        </p>
                    </xsl:for-each>
                </xsl:for-each>
                <!-- return link added 2004-09-09 by sp -->
                <a class="return" href="#a0">Return to the Top of Page</a>
                <hr />
            </xsl:if>
        </xsl:template>
        
        <!--This template rule formats a top-level accessretrict element. -->
        <xsl:template name="archdesc-restrict">
            <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:accessrestrict[string-length(text()|*)!=0]
                | ead/archdesc/descgrp/userestrict[string-length(text()|*)!=0]">
                <h3>
                    <a name="a14">
                        <xsl:text>Restrictions</xsl:text>
                        
                    </a></h3>
                <!-- text added at request of the AJHS staff 2009-02-10 by stp -->
                <xsl:for-each select="ead:ead/ead:archdesc/ead:descgrp/ead:accessrestrict">
                    <!-- a new style definition added in ordert to change the color of <head> in <acccessrestrict> by sp 11/20/2003-->
                    <h3 class="subheading">
                        <xsl:value-of select="ead:head"/>
                    </h3>
                    <xsl:for-each select="p[1]">
                        <p class="note">
                            <!--<xsl:apply-templates select="."/>-->
                            <!--      <xsl:call-template name="search_replace"/>-->
                            <xsl:text>
                                The collection is open to all researchers by permission of the Director of Library and Archives of the American Jewish Historical Society, except items that are restricted due to their fragility.</xsl:text>
                        </p>  
                    </xsl:for-each>
                    <xsl:for-each select="p[2] | p[3] | p[4] | p[5] | p[6] | p[7] | p[8] | p[9] | p[10] | p[11] | p[12] | p[13] | p[14] | p[15]">
                        <p class="note">
                            <xsl:apply-templates select="."/>
                        </p> 
                    </xsl:for-each>
                </xsl:for-each>
                <!-- text added at request of the AJHS staff 2009-02-10 by stp -->
                <xsl:for-each select="ead:ead/ead:archdesc/ead:descgrp/ead:userestrict">
                    <h3 class="subheading">
                        <xsl:value-of select="ead:head"/>
                    </h3>
                    <xsl:for-each select="p[1]">
                        <p class="note">
                            <!--<xsl:apply-templates select="."/>-->
                            <!--      <xsl:call-template name="search_replace"/>-->
                            Information concerning the literary rights may be obtained from the Director of Library and Archives of the American Jewish Historical Society. Users must apply in writing
                            for permission to quote, reproduce or otherwise publish manuscript materials
                            found in this collection. For more information contact:
                            <br />
                            American Jewish Historical Society, Center for Jewish History, 15 West 16<sup>th</sup> Street, New York, N.Y., 10011
                            <br />email:&#x00A;<a href="mailto:archives@hadassah.org" show="new" title="email address of Hadassah">archives@hadassah.org</a>
                        </p>
                    </xsl:for-each>
                    <xsl:for-each select="p[2] | p[3] | p[4] | p[5] | p[6] | p[7] | p[8] | p[9] | p[10] | p[11] | p[12] | p[13] | p[14] | p[15]">
                        <p class="note">
                            <xsl:apply-templates select="."/>
                        </p> 
                    </xsl:for-each>
                </xsl:for-each>
                
                <!-- return link added 2004-09-09 by sp -->
                <a class="return" href="#a0">Return to the Top of Page</a>
                <hr />
                
            </xsl:if>
        </xsl:template>
        
        <!-- admininfo as a wrapper dropped on 2004-09-09 -->
        
        <xsl:template name="archdesc-descgrp">
            <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:prefercite[string-length(text()|*)!=0]
                | ead/archdesc/descgrp/custodhist[string-length(text()|*)!=0]
                | ead/archdesc/descgrp/altformavail[string-length(text()|*)!=0]
                | ead/archdesc/descgrp/acqinfo[string-length(text()|*)!=0]
                | ead/archdesc/descgrp/processinfo[string-length(text()|*)!=0]
                | ead/archdesc/descgrp/appraisal[string-length(text()|*)!=0]
                | ead/archdesc/descgrp/accruals[string-length(text()|*)!=0]">
                <!--
                    <h3><a name="a13">
                    <xsl:text>Administrative Information</xsl:text>
                    </a></h3>
                -->
                <!-- LBI usually does not display the custodhist information -->
                <xsl:call-template name="archdesc-custodhist"/>
                <xsl:call-template name="archdesc-altform"/>
                <xsl:call-template name="archdesc-prefercite"/>
                <xsl:call-template name="archdesc-acqinfo"/>
                <xsl:call-template name="archdesc-processinfo"/>
                <xsl:call-template name="archdesc-appraisal"/>
                <xsl:call-template name="archdesc-accruals"/>
            </xsl:if>
        </xsl:template>
        
        <!--This template rule formats a top-level st element. -->
        <!-- LBI usually does not display the provenance information -->
        <xsl:template name="archdesc-custodhist">
            <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:custodhist[string-length(text()|*)!=0]">
                <xsl:for-each select="ead:ead/ead:archdesc/ead:descgrp/ead:custodhist">
                    <h3>
                        <a name="a16">
                            <xsl:apply-templates select="ead:head"/>
                        </a>
                    </h3>
                    <xsl:for-each select="ead:p">
                        <p class="note">
                            <xsl:apply-templates select="."/>
                        </p>
                    </xsl:for-each>
                </xsl:for-each>
                <!-- return link added 2004-12-28 by sp -->
                <a class="return" href="#a0">Return to the Top of Page</a>
                <hr />
            </xsl:if>
        </xsl:template>
        
        <!--This template rule formats a top-level altformavail element. -->
        <xsl:template name="archdesc-altform">
            <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:altformavail[string-length(text()|*)!=0]">
                <xsl:for-each select="ead:ead/ead:archdesc/ead:descgrp/ead:altformavail">
                    <h3>
                        <a name="a17">
                            <xsl:apply-templates select="ead:head"/>
                        </a></h3>
                    <xsl:for-each select="ead:p">
                        <p class="note">
                            <xsl:apply-templates select="."/>
                        </p>
                    </xsl:for-each>
                    
                    <!-- added list 2004/7/28 by sp -->
                    <xsl:for-each select="ead:list">
                        <xsl:choose>
                            <xsl:when test="@type='ordered'">
                                <ol>
                                    <xsl:for-each select="ead:head">
                                        <li class="head">
                                            <xsl:apply-templates/>
                                        </li>
                                    </xsl:for-each>
                                    
                                    <xsl:for-each select="ead:item">
                                        <li>
                                            <xsl:apply-templates/>
                                        </li>
                                    </xsl:for-each>
                                </ol>
                            </xsl:when>
                            
                            <xsl:otherwise>
                                <ul class="note">
                                    <xsl:for-each select="ead:head">
                                        <li class="head">
                                            <xsl:apply-templates/>
                                        </li>
                                    </xsl:for-each>
                                    
                                    <xsl:for-each select="ead:item">
                                        <li>
                                            <xsl:apply-templates/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    <!-- return link added 2004-09-09 by sp -->
                    <a class="return" href="#a0">Return to the Top of Page</a>
                    <hr />
                </xsl:for-each>
            </xsl:if>
        </xsl:template>
        
        <!--This template rule formats a top-level prefercite element. -->
        <xsl:template name="archdesc-prefercite">
            <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:prefercite[string-length(text()|*)!=0]">
                <xsl:for-each select="ead:ead/ead:archdesc/ead:descgrp/ead:prefercite">
                    <h3>
                        <a name="a18">
                            <xsl:apply-templates select="ead:head"/>
                        </a>
                    </h3>
                    <xsl:for-each select="ead:p">
                        <p class="note">
                            <xsl:apply-templates select="."/>
                        </p>
                    </xsl:for-each>
                </xsl:for-each>
                
                <!-- return link added 2004-09-09 by sp -->
                <a class="return" href="#a0">Return to the Top of Page</a>
                <hr />
                
            </xsl:if>
        </xsl:template>
        
        <!--This template rule formats a top-level acqinfo element. -->
        <xsl:template name="archdesc-acqinfo">
            <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:acqinfo[string-length(text()|*)!=0]">
                <xsl:for-each select="ead:ead/ead:archdesc/ead:descgrp/ead:acqinfo">
                    <h3> 
                        <a name="a19">
                            <xsl:apply-templates select="ead:head"/>
                        </a></h3>
                    <xsl:for-each select="ead:p">
                        <p class="note">
                            <xsl:apply-templates select="."/>
                        </p>
                    </xsl:for-each>
                </xsl:for-each>
                
                <!-- return link added 2004-09-09 by sp -->
                <a class="return" href="#a0">Return to the Top of Page</a>
                <hr />
            </xsl:if>
        </xsl:template>
        
        <!--This template rule formats a top-level procinfo element. -->
        <xsl:template name="archdesc-processinfo">
            <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:processinfo[string-length(text()|*)!=0]">
                <xsl:for-each select="ead:ead/ead:archdesc/ead:descgrp/ead:processinfo">
                    <h3>
                        <a name="a20">
                            <xsl:apply-templates select="ead:head"/>
                        </a></h3>
                    <xsl:for-each select="ead:p">
                        <p class="note">
                            <xsl:apply-templates select="."/>
                        </p>
                    </xsl:for-each>
                </xsl:for-each>
                <!-- return link added 2004-09-09 by sp -->
                <a class="return" href="#a0">Return to the Top of Page</a>
                <hr />
            </xsl:if>
        </xsl:template>
        
        <!--This template rule formats a top-level appraisal element. -->
        <xsl:template name="archdesc-appraisal">
            <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:appraisal[string-length(text()|*)!=0]">
                <xsl:for-each select="ead:ead/ead:archdesc/ead:descgrp/ead:appraisal">
                    <h3> 
                        <a name="a21">
                            <xsl:apply-templates select="ead:head"/>
                        </a></h3>
                    <xsl:for-each select="ead:p">
                        <p class="note">
                            <xsl:apply-templates select="."/>
                        </p>
                    </xsl:for-each>
                </xsl:for-each>
                <!-- return link added 2004-09-09 by sp -->
                <a class="return" href="#a0">Return to the Top of Page</a>
                <hr />
            </xsl:if>
        </xsl:template>
        
        <!--This template rule formats a top-level accruals element. -->
        <xsl:template name="archdesc-accruals">
            <xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:accruals[string-length(text()|*)!=0]">
                <xsl:for-each select="ead:ead/ead:archdesc/ead:descgrp/ead:accruals">
                    <h3>
                        <a name="a22">
                            <xsl:apply-templates select="ead:head"/>
                        </a></h3>
                    <xsl:for-each select="ead:p">
                        <p class="note">
                            <xsl:apply-templates select="."/>
                        </p>
                    </xsl:for-each>
                </xsl:for-each>
                <!-- return link added 2004-09-09 by sp -->
                <a class="return" href="#a0">Return to the Top of Page</a>
                <hr />
            </xsl:if>
        </xsl:template>
        
        <xsl:template name="archdesc-control">
            <xsl:if test="ead:ead/ead:archdesc/ead:controlaccess[string-length(text()|*)!=0]">
                <xsl:for-each select="ead:ead/ead:archdesc/ead:controlaccess">
                    <xsl:call-template name="controlAccess"/>                   
                </xsl:for-each>
                <!-- return link added 2004-09-09 by sp -->
                <a class="return" href="#a0">Return to the Top of Page</a>
                <hr />
            </xsl:if>
        </xsl:template>

<xsl:variable name="box-and-folder-heading">
<tr class="headerline">
<td width="10%">Box</td>
<td width="10%">Folder</td>
<td width="55%">Title</td>
<td width="25%">Date</td>
</tr>
</xsl:variable>

<xsl:variable name="box-and-item-heading">
<tr class="headerline">
<td width="10%">Box</td>
<td width="10%">&#x00A0;</td>
<td width="55%">Item</td>
<td width="25%">Date</td>
</tr>
</xsl:variable>

<xsl:variable name="box-heading">
<tr class="headerline">
<td width="10%">Box</td>
<td width="10%">&#x00A0;</td>
<td width="55%">Title</td>
<td width="25%">Date</td>
</tr>
</xsl:variable>

<xsl:variable name="reel-heading">
<tr class="headerline">
<td width="10%">Reel</td>
<td width="10%">&#x00A0;</td>
<td width="55%">Title</td>
<td width="25%">Date</td>
</tr>
</xsl:variable>

<xsl:variable name="folder-heading">
<tr class="headerline">
<td width="10%">Folder</td>
<td width="10%">&#x00A0;</td>
<td width="55%">Title</td>
<td width="25%">Date</td>
</tr>
</xsl:variable>

<xsl:variable name="folder-reel-frame-heading">
<tr class="headerline">
<td width="10%">Folder</td>
<td width="10%">Reel/Frame</td>
<td width="55%">Title</td>
<td width="25%">Date</td></tr>
</xsl:variable>

<xsl:variable name="folder-reel-heading">
<tr class="headerline">
<td width="10%">Folder</td>
<td width="10%">Reel</td>
<td width="55%">Title</td>
<td width="25%">Date</td>
</tr>
</xsl:variable>

 <xsl:template name="dsc">
  <xsl:for-each select="ead:ead/ead:archdesc/ead:dsc">
<h2><a name="a23">
    <xsl:apply-templates select="ead:head"/>
</a></h2>
      <xsl:if test="child::ead:p">
          <p class="firstparagraph"><xsl:apply-templates select="ead:p"/></p>
</xsl:if>
</xsl:for-each>

     <xsl:for-each select="ead:ead/ead:archdesc/ead:dsc/ead:c01">
            <table class="highestcomponent">
                <tr>
                    <td colspan="4">
                        <a id="{@id}"/>
                        <h3><xsl:apply-templates select="ead:did/ead:unittitle"/>,
                                <xsl:apply-templates select="ead:did/ead:unitdate"/></h3>
                    </td>
                </tr>

                <xsl:if test="ead:did/ead:langmaterial">
                    <tr>
                        <td colspan="4" class="physlang">
                            <xsl:apply-templates select="ead:did/ead:langmaterial"/>
                        </td>
                    </tr>
                </xsl:if>

                <xsl:if test="ead:did/ead:physdesc">
                    <tr>
                        <td colspan="4" class="physlang">
                            <xsl:apply-templates select="ead:did/ead:physdesc"/>
                        </td>
                    </tr>
                </xsl:if>

                <xsl:if test="ead:did/ead:abstract">
                    <tr>
                        <td colspan="4">
                            <p class="componentnote">
                                <xsl:apply-templates select="ead:did/ead:abstract"/>
                            </p>
                        </td>
                    </tr>
                </xsl:if>

                <xsl:if test="./child::ead:arrangement">
                    <tr>
                        <td colspan="4">
                            <h5 class="componentnote">Arrangement:</h5>
                            <xsl:for-each select="ead:arrangement/ead:p">
                                <p class="componentnote">
                                    <xsl:apply-templates select="."/>
                                </p>
                            </xsl:for-each>
                            <!--
    <xsl:for-each select="ead:arrangement/ead:list"">
      <ul>
<xsl:apply-templates select="."/>
      </ul>
    </xsl:for-each>
     -->
                            <xsl:if test="ead:arrangement/ead:list">
                                <xsl:apply-templates select="ead:arrangement/ead:list"/>
                            </xsl:if>
                        </td>
                    </tr>
                </xsl:if>

                <xsl:if test="./child::ead:scopecontent">
                    <tr>
                        <td colspan="4">
                            <h5 class="componentnote">Scope and Content:</h5>
                            <xsl:for-each select="ead:scopecontent/ead:p">
                                <p class="componentnote">
                                    <xsl:apply-templates select="."/>
                                </p>
                            </xsl:for-each>
                        </td>
                    </tr>
                </xsl:if>

                <tr>
                    <td colspan="4">
                        <xsl:if test="./child::ead:controlaccess">
                    <xsl:for-each select="ead:controlaccess">
                        <xsl:call-template name="controlAccess"/>
                    </xsl:for-each>
                        </xsl:if>
                    </td>
                    </tr>

                <!-- c02 -->
                <xsl:variable name="subseriestitle">
                    <xsl:value-of select="ead:c02/ead:did/ead:unittitle"/>
                </xsl:variable>
                <xsl:for-each select="ead:c02">
                    <xsl:choose>

                        <!-- the title of the 'section' without comma after "unittitle" -->
                        <xsl:when test="@otherlevel='section' or @otherlevel='subsubseries'">
                            <tr>
                                <td colspan="4">
                                    <h4 class="section">
                                        <xsl:apply-templates select="ead:did/ead:unittitle"
                                        />&#x00A0; <xsl:apply-templates
                                            select="ead:did/ead:unitdate"/></h4>
                                </td>
                            </tr>
                        </xsl:when>

                        <!-- the exclusion of attribute @level='file' added on 2003/10/10 by sp -->
                        <xsl:when
                            test="@level='subseries' or @level='series' or contains($subseriestitle, 'Subseries') and not(@level='file')">
                            <tr>
                                <td colspan="4">
                                    <h4>
                                        <xsl:apply-templates select="ead:did/ead:unittitle"
                                        />,&#x00A0; <xsl:for-each select="ead:did/ead:unitdate">
                                            <xsl:apply-templates/>
                                        </xsl:for-each></h4>
                                </td>
                            </tr>

                            <!-- physdesc and langmaterial changed by sp on 2004/05/05 -->
                            <xsl:if test="ead:did/ead:langmaterial">
                                <tr>
                                    <td colspan="4" class="physlang">
                                        <xsl:apply-templates select="ead:did/ead:langmaterial"/>
                                    </td>
                                </tr>
                            </xsl:if>

                            <xsl:if test="ead:did/ead:physdesc">
                                <tr>
                                    <td colspan="4" class="physlang">
                                        <xsl:apply-templates select="ead:did/ead:physdesc"/>
                                    </td>
                                </tr>
                            </xsl:if>

                            <xsl:if test="ead:did/ead:abstract">
                                <tr>
                                    <td colspan="4">
                                        <p class="componentnote">
                                            <xsl:apply-templates select="ead:did/ead:abstract"/>
                                        </p>
                                    </td>
                                </tr>
                            </xsl:if>

                            <xsl:if test="ead:did/ead:note">
                                <tr>
                                    <td colspan="4">
                                        <p class="componentnote">
                                            <xsl:apply-templates select="ead:did/ead:note"/>
                                        </p>
                                    </td>
                                </tr>
                            </xsl:if>
                            <!-- moved into when element 2005-03-21 by sp -->
                            <xsl:if test="./child::arrangement">
                                <tr>
                                    <td colspan="4">
                                        <h5 class="componentnote">Arrangement:</h5>
                                        <xsl:for-each select="ead:arrangement/ead:p">
                                            <p class="componentnote">
                                                <xsl:apply-templates/>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                            </xsl:if>

                            <xsl:if test="./child::ead:scopecontent">
                                <tr>
                                    <td colspan="4">
                                        <h5 class="componentnote">Scope and Content:</h5>
                                        <xsl:for-each select="ead:scopecontent/ead:p">
                                            <p class="componentnote">
                                                <xsl:apply-templates/>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                            </xsl:if>

                            <xsl:if test="./child::ead:userestrict | ./child::ead:accessrestrict">
                                <tr>
                                    <td colspan="4">
                                        <h5 class="componentnote">Restrictions:</h5>
                                        <xsl:for-each
                                            select="ead:userestrict/ead:p | ead:accessrestrict/ead:p">
                                            <p class="componentnote">
                                                <xsl:apply-templates select="."/>
                                            </p>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                            </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- do nothing be happy-->
                        </xsl:otherwise>
                    </xsl:choose>


                    <xsl:for-each select="ead:did/ead:container">
                        <xsl:variable name="box-number" select="self::ead:container[@type='Box']"/>
                        <!-- lots of ugly tree-climbing here but this determines in a succinct fashion whether to render the container header -->
                        <xsl:if test="@type='Box'">
                            <xsl:choose>
                                <xsl:when
                                    test="not(../../preceding-sibling::ead:c02/ead:did[ead:container[@type='Box']=$box-number]
                                    or ../preceding-sibling::ead:c02/ead:did[ead:container[@type='Box']=$box-number])">
                                    <xsl:if
                                        test="./following-sibling::ead:container[@type='Folder']">
                                        <xsl:copy-of select="$box-and-folder-heading"/>
                                    </xsl:if>

                                    <xsl:if test="./following-sibling::ead:container[@type='item']">
                                        <xsl:copy-of select="$box-and-item-heading"/>
                                    </xsl:if>
                                    <xsl:if
                                        test="not(./following-sibling::ead:container[@type='Folder']
 or ./following-sibling::ead:container[@type='item'])">
                                        <xsl:copy-of select="$box-heading"/>
                                    </xsl:if>

                                    <xsl:if
                                        test="./following-sibling::ead:container[@type='Folder']">
                                        <tr>
                                            <td width="10%">
                                                <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"/>
                                            </td>
                                            <td width="10%">
                                                <xsl:apply-templates
                                                  select="following-sibling::ead:container[@type='Folder']"
                                                />
                                            </td>
                                            <td width="55%">
                                                <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"/>
                                            </td>
                                            <td width="25%">
                                                <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"/>
                                            </td>
                                        </tr>
                                        <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                        <xsl:if
                                            test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                            <tr class="filenote">
                                                <td width="10%">&#x00A0;</td>
                                                <td width="10%">&#x00A0;</td>
                                                <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                </td>
                                                <td width="25%">&#x00A0;</td>
                                            </tr>
                                        </xsl:if>
                                        <!-- edit end -->
                                    </xsl:if>

                                    <xsl:if test="./following-sibling::ead:container[@type='item']">
                                        <tr>
                                            <td width="10%">
                                                <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"/>
                                            </td>
                                            <td width="10%">&#x00A0;</td>
                                            <td width="55%">
                                                <xsl:apply-templates
                                                  select="following-sibling::ead:container[@type='item']"
                                                />
                                            </td>
                                            <!--<td width="40%"><xsl:apply-templates select="preceding-sibling::ead:unittitle"/></td>-->
                                            <td width="25%">
                                                <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"/>
                                            </td>
                                        </tr>
                                    </xsl:if>

                                    <xsl:if test="not(./following-sibling::ead:container)">
                                        <tr>
                                            <td width="10%">
                                                <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"/>
                                            </td>
                                            <td width="10%">&#x00A0;</td>
                                            <td width="55%">
                                                <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"/>
                                            </td>
                                            <td width="25%">
                                                <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"/>
                                            </td>
                                        </tr>
                                        <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                        <xsl:if
                                            test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                            <tr class="filenote">
                                                <td width="10%">&#x00A0;</td>
                                                <td width="10%">&#x00A0;</td>
                                                <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                </td>
                                                <td width="25%">&#x00A0;</td>
                                            </tr>
                                        </xsl:if>
                                        <!-- edit end -->
                                    </xsl:if>
                                </xsl:when>

                                <xsl:otherwise>
                                    <!-- add no header (because they belong to the same box), but still number boxes, since we like repeated box numbers -->
                                    <!-- to remove repeated box numbers replace the first td's contents with the hex for a nbsp -->
                                    <xsl:if
                                        test="./following-sibling::ead:container[@type='Folder']">
                                        <tr>
                                            <td width="10%">
                                                <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"/>
                                            </td>
                                            <td width="10%">
                                                <xsl:apply-templates
                                                  select="following-sibling::ead:container[@type='Folder']"
                                                />
                                            </td>
                                            <td width="55%">
                                                <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"/>
                                            </td>
                                            <td width="25%">
                                                <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"/>
                                            </td>
                                        </tr>
                                        <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                        <xsl:if
                                            test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                            <tr class="filenote">
                                                <td width="10%">&#x00A0;</td>
                                                <td width="10%">&#x00A0;</td>
                                                <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                </td>
                                                <td width="25%">&#x00A0;</td>
                                            </tr>
                                        </xsl:if>
                                        <!-- edit end -->
                                    </xsl:if>

                                    <!-- test to see if it is a freestanding box without any folders etc within -->
                                    <xsl:if test="not(./following-sibling::ead:container)">
                                        <tr>
                                            <td width="10%">
                                                <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"/>
                                            </td>
                                            <td width="10%">&#x00A0;</td>
                                            <td width="55%">
                                                <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"/>
                                            </td>
                                            <td width="25%">
                                                <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"/>
                                            </td>
                                        </tr>
                                        <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                        <xsl:if
                                            test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                            <tr class="filenote">
                                                <td width="10%">&#x00A0;</td>
                                                <td width="10%">&#x00A0;</td>
                                                <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                </td>
                                                <td width="25%">&#x00A0;</td>
                                            </tr>
                                        </xsl:if>
                                        <!-- edit end -->
                                    </xsl:if>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                        <!-- end it is a box with whatever contents-->

                        <!-- here test to see whether we have a free-standing reel or folder with various contents -->
                        <xsl:if
                            test="@type='reel' and not(./preceding-sibling::ead:container[@type='Box']) and not(./preceding-sibling::ead:container[@type='Folder'])">
                            <xsl:copy-of select="$reel-heading"/>
                            <tr>
                                <td width="10%">
                                    <xsl:apply-templates select="self::ead:container[@type='reel']"
                                    />
                                </td>
                                <td width="10%">&#x00A0;</td>
                                <td width="55%">
                                    <xsl:apply-templates select="preceding-sibling::ead:unittitle"/>
                                </td>
                                <td width="25%" valign="top">
                                    <xsl:apply-templates select="following-sibling::ead:unitdate"/>
                                </td>
                            </tr>
                            <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                            <xsl:if
                                test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                <tr class="filenote">
                                    <td width="10%">&#x00A0;</td>
                                    <td width="10%">&#x00A0;</td>
                                    <td width="55%">
                                        <xsl:for-each
                                            select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                            <p class="filenote">
                                                <xsl:apply-templates select="."/>
                                            </p>
                                        </xsl:for-each>
                                        <xsl:if
                                            test="../following-sibling::ead:scopecontent/ead:list">
                                            <ul class="filelist">
                                                <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                />
                                            </ul>
                                        </xsl:if>
                                        <xsl:if test="following-sibling::ead:langmaterial">
                                            <xsl:apply-templates
                                                select="./following-sibling::ead:langmaterial"
                                            />&#x00A0; </xsl:if>
                                        <xsl:apply-templates select="./following-sibling::physdesc"/>
                                        <xsl:if
                                            test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                            <xsl:for-each
                                                select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                <p>
                                                  <xsl:apply-templates select="."/>
                                                </p>
                                            </xsl:for-each>
                                        </xsl:if>
                                    </td>
                                    <td width="25%">&#x00A0;</td>
                                </tr>
                            </xsl:if>
                            <!-- edit end -->
                        </xsl:if>

                        <!-- this is for collections which do not have boxes, but refer to folder and reel/frames of microfilm - yivo -->

                        <xsl:if test="@type='Folder'">
                            <xsl:choose>
                                <xsl:when
                                    test="not(../preceding-sibling::ead:c02/ead:did[ead:container[@type='Folder']=$folder-heading]
 or ./preceding-sibling::ead:container[@type='Box'])">

                                    <xsl:if test="not(./following-sibling::ead:container)">
                                        <xsl:copy-of select="$folder-heading"/>
                                    </xsl:if>

                                    <xsl:if
                                        test="./following-sibling::ead:container[@type='reel-frame']">
                                        <xsl:copy-of select="$folder-reel-frame-heading"/>
                                    </xsl:if>

                                    <xsl:if test="./following-sibling::ead:container[@type='reel']">
                                        <xsl:copy-of select="$folder-reel-heading"/>
                                    </xsl:if>
                                    <tr>
                                        <td width="10%">
                                            <xsl:apply-templates
                                                select="self::ead:container[@type='Folder']"/>
                                        </td>
                                        <td width="10%">
                                            <xsl:apply-templates
                                                select="following-sibling::ead:container[@type='reel-frame' or @type='reel']"
                                            />
                                        </td>
                                        <td width="55%">
                                            <xsl:apply-templates
                                                select="preceding-sibling::ead:unittitle"/>
                                        </td>
                                        <td width="25%">
                                            <xsl:apply-templates
                                                select="following-sibling::ead:unitdate"/>
                                        </td>
                                    </tr>
                                    <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                    <xsl:if
                                        test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                        <tr class="filenote">
                                            <td width="10%">&#x00A0;</td>
                                            <td width="10%">&#x00A0;</td>
                                            <td width="55%">
                                                <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                </xsl:for-each>
                                                <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                </xsl:if>
                                                <xsl:if test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                </xsl:if>
                                            </td>
                                            <td width="25%">&#x00A0;</td>
                                        </tr>
                                    </xsl:if>
                                    <!-- edit end -->
                                </xsl:when>

                                <xsl:otherwise> </xsl:otherwise>

                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>

                    <!-- c03 -->

                    <xsl:variable name="c03title">
                        <xsl:value-of select="ead:c03/ead:did/ead:unittitle"/>
                    </xsl:variable>

                    <xsl:for-each select="ead:c03">
                        <xsl:choose>
                            <!-- the title of the 'section' without comma after "unittitle" -->
                            <xsl:when test="@otherlevel='section'">
                                <tr>
                                    <td colspan="4">
                                        <h4 class="section">
                                            <xsl:apply-templates select="ead:did/ead:unittitle"/>
                                        </h4>
                                    </td>
                                </tr>
                            </xsl:when>

                            <!--class for the subsubseries heading added by sp 2004/07/22 -->
                            <xsl:when
                                test="@level='c03title' or @level='subseries' or @otherlevel='subsubseries' or contains($c03title, 'Subseries')">
                                <tr>
                                    <td colspan="4">
                                        <h4 class="subseries"><xsl:apply-templates
                                                select="ead:did/ead:unittitle"/>,&#x00A0;
                                                <xsl:for-each select="ead:did/ead:unitdate">
                                                <xsl:apply-templates/>
                                            </xsl:for-each>. </h4>
                                    </td>
                                </tr>


                                <!-- physdesc and langmaterial changed by sp on 2004/05/05 -->
                                <xsl:if test="ead:did/ead:langmaterial">
                                    <tr>
                                        <td colspan="4" class="physlang">
                                            <xsl:apply-templates select="ead:did/ead:langmaterial"/>
                                        </td>
                                    </tr>
                                </xsl:if>

                                <xsl:if test="ead:did/ead:physdesc">
                                    <tr>
                                        <td colspan="4" class="physlang">
                                            <xsl:apply-templates select="ead:did/ead:physdesc"/>
                                        </td>
                                    </tr>
                                </xsl:if>

                                <xsl:if test="ead:did/ead:abstract">
                                    <tr>
                                        <td colspan="4">
                                            <p class="componentnote">
                                                <xsl:apply-templates select="ead:did/ead:abstract"/>
                                            </p>
                                        </td>
                                    </tr>
                                </xsl:if>

                                <!-- added 2001/11/06 -->
                                <xsl:if test="./child::arrangement">
                                    <tr>
                                        <td colspan="4">
                                            <h5 class="componentnote">Arrangement:</h5>
                                            <xsl:for-each select="ead:arrangement/ead:p">
                                                <p class="componentnote">
                                                  <xsl:apply-templates select="."/>
                                                </p>
                                            </xsl:for-each>
                                        </td>
                                    </tr>
                                </xsl:if>

                                <xsl:if test="./child::scopecontent">
                                    <tr>
                                        <td colspan="4">
                                            <h5 class="componentnote">Scope and Content:</h5>
                                            <xsl:for-each select="ead:scopecontent/ead:p">
                                                <p class="componentnote">
                                                  <xsl:apply-templates select="."/>
                                                </p>
                                            </xsl:for-each>
                                        </td>
                                    </tr>
                                </xsl:if>

                                <xsl:if
                                    test="./child::ead:userestrict | ./child::ead:accessrestrict">
                                    <tr>
                                        <td colspan="4">
                                            <h5 class="componentnote">Restrictions:</h5>
                                            <xsl:for-each
                                                select="ead:userestrict/ead:p | ead:accessrestrict/ead:p">
                                                <p class="componentnote">
                                                  <xsl:apply-templates select="."/>
                                                </p>
                                            </xsl:for-each>
                                        </td>
                                    </tr>
                                </xsl:if>
                            </xsl:when>

                            <xsl:otherwise>
                                <!-- do nothing be happy-->
                            </xsl:otherwise>
                        </xsl:choose>

                        <xsl:for-each select="ead:did/ead:container">
                            <xsl:variable name="c03-box-number"
                                select="self::ead:container[@type='Box']"/>
                            <!-- lots of ugly tree-climbing here but this determines in a succinct fashion whether to render the container header -->

                            <xsl:if test="@type='Box'">
                                <xsl:choose>
                                    <xsl:when
                                        test="not(../../preceding-sibling::ead:c03/ead:did[ead:container[@type='Box']=$c03-box-number] or
                                        ../preceding-sibling::ead:c03/ead:did[ead:container[@type='Box']=$c03-box-number])
                                        or ../../preceding-sibling::ead:c03/ead:did[ead:container[@type='volume']]">

                                        <xsl:if
                                            test="./following-sibling::ead:container[@type='Folder']">
                                            <xsl:copy-of select="$box-and-folder-heading"/>
                                        </xsl:if>

                                        <xsl:if
                                            test="./following-sibling::ead:container[@type='item']">
                                            <xsl:copy-of select="$box-and-item-heading"/>
                                        </xsl:if>

                                        <xsl:if
                                            test="not(./following-sibling::ead:container[@type='Folder']
or ./following-sibling::ead:container[@type='item'])">
                                            <xsl:copy-of select="$box-heading"/>
                                        </xsl:if>

                                        <xsl:if
                                            test="./following-sibling::ead:container[@type='Folder']">
                                            <tr>
                                                <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"/>
                                                </td>
                                                <td width="10%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:container[@type='Folder']"
                                                  />
                                                </td>
                                                <td width="55%">
                                                  <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"/>
                                                </td>
                                                <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"/>
                                                </td>
                                            </tr>

                                            <!-- dao test on the c03 level -->
                                            <xsl:if
                                                test="./following-sibling::dao[@role='digitool-ptr']">
                                                <tr>
                                                  <td/>
                                                  <td/>
                                                  <td colspan="2">
                                                  <xsl:for-each
                                                  select="./following-sibling::dao/daodesc/p">
                                                  <p class="digitool-ptr">
                                                  <xsl:apply-templates/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </td>
                                                </tr>
                                            </xsl:if>

                                            <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                            <xsl:if
                                                test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates select="."
                                                  />
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                </tr>
                                            </xsl:if>
                                            <!-- edit end -->
                                        </xsl:if>

                                        <xsl:if
                                            test="./following-sibling::ead:container[@type='item']">
                                            <tr>
                                                <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"/>
                                                </td>
                                                <td width="10%">&#x00A0;</td>
                                                <td width="55%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:container[@type='item']"
                                                  />
                                                </td>
                                                <!--<td width="40%"><xsl:apply-templates select="preceding-sibling::ead:unittitle"/></td>-->
                                                <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"/>
                                                </td>
                                            </tr>
                                            <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                            <xsl:if
                                                test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates select="."
                                                  />
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                </tr>
                                            </xsl:if>
                                            <!-- edit end -->
                                        </xsl:if>

                                        <xsl:if test="not(./following-sibling::ead:container)">
                                            <tr>
                                                <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"/>
                                                </td>
                                                <td width="10%">&#x00A0;</td>
                                                <td width="55%">
                                                  <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"/>
                                                </td>
                                                <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"/>
                                                </td>
                                            </tr>
                                            <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                            <xsl:if
                                                test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates select="."
                                                  />
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                </tr>
                                            </xsl:if>
                                            <!-- edit end -->
                                        </xsl:if>
                                    </xsl:when>

                                    <xsl:otherwise>
                                        <!-- add no header (because they belong to the same box), but still number boxes, since we like repeated box numbers -->
                                        <!-- to remove repeated box numbers replace the first td's contents with the hex for a nbsp -->
                                        <xsl:if
                                            test="./following-sibling::ead:container[@type='Folder']">
                                            <tr>
                                                <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"/>
                                                </td>
                                                <td width="10%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:container[@type='Folder']"
                                                  />
                                                </td>
                                                <td width="55%">
                                                  <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"/>
                                                </td>
                                                <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"/>
                                                </td>
                                            </tr>
                                            <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                            <!-- added on 2007-03-06 -->
                                            <xsl:if
                                                test="./following-sibling::dao[@role='digitool-ptr']">
                                                <tr>
                                                  <td/>
                                                  <td/>
                                                  <td colspan="2">
                                                  <xsl:for-each
                                                  select="./following-sibling::dao/daodesc/p">
                                                  <p class="digitool-ptr">
                                                  <xsl:apply-templates/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </td>
                                                </tr>
                                            </xsl:if>
                                            <xsl:if
                                                test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates select="."
                                                  />
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                </tr>
                                            </xsl:if>
                                            <!-- edit end -->
                                        </xsl:if>

                                        <!-- test to see if it is a freestanding box without any folders etc within -->
                                        <xsl:if test="not(./following-sibling::ead:container)">
                                            <tr>
                                                <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"/>
                                                </td>
                                                <td width="10%">&#x00A0;</td>
                                                <td width="55%">
                                                  <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"/>
                                                </td>
                                                <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"/>
                                                </td>
                                            </tr>
                                            <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                            <xsl:if
                                                test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates select="."
                                                  />
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                </tr>
                                            </xsl:if>
                                            <!-- edit end -->
                                        </xsl:if>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                            <!-- end it is a box with whatever contents-->

                            <!-- here test to see whether we have a free-standing reel or folder with various contents -->
                            <xsl:if
                                test="@type='reel' and not(./preceding-sibling::ead:container[@type='Box']) and not(./preceding-sibling::ead:container[@type='Folder'])">
                                <xsl:copy-of select="$reel-heading"/>
                                <tr>
                                    <td width="10%">
                                        <xsl:apply-templates
                                            select="self::ead:container[@type='reel']"/>
                                    </td>
                                    <td width="10%">&#x00A0;</td>
                                    <td width="55%">
                                        <xsl:apply-templates select="preceding-sibling::ead:unittitle"/>
                                    </td>
                                    <td width="25%" valign="top">
                                        <xsl:apply-templates select="following-sibling::ead:unitdate"/>
                                    </td>
                                </tr>
                                <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                <xsl:if
                                    test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                    <tr class="filenote">
                                        <td width="10%">&#x00A0;</td>
                                        <td width="10%">&#x00A0;</td>
                                        <td width="55%">
                                            <xsl:for-each
                                                select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                <p class="filenote">
                                                  <xsl:apply-templates select="."/>
                                                </p>
                                            </xsl:for-each>
                                            <xsl:if
                                                test="../following-sibling::ead:scopecontent/ead:list">
                                                <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                </ul>
                                            </xsl:if>
                                            <xsl:if test="following-sibling::ead:langmaterial">
                                                <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                />&#x00A0; </xsl:if>
                                            <xsl:apply-templates
                                                select="./following-sibling::physdesc"/>
                                            <xsl:if
                                                test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                </xsl:for-each>
                                            </xsl:if>
                                        </td>
                                        <td width="25%">&#x00A0;</td>
                                    </tr>
                                </xsl:if>
                                <!-- edit end -->
                            </xsl:if>

                            <!-- this is for collections which do not have boxes, but refer to folder and reel/frames of microfilm - yivo -->

                            <xsl:if test="@type='Folder'">
                                <xsl:choose>
                                    <xsl:when
                                        test="not(../preceding-sibling::ead:c02/ead:did[ead:container[@type='Folder']=$folder-heading]
 or ./preceding-sibling::ead:container[@type='Box'])">

                                        <xsl:if test="not(./following-sibling::ead:container)">
                                            <xsl:copy-of select="$folder-heading"/>
                                        </xsl:if>

                                        <xsl:if
                                            test="./following-sibling::ead:container[@type='reel-frame']">
                                            <xsl:copy-of select="$folder-reel-frame-heading"/>
                                        </xsl:if>

                                        <xsl:if
                                            test="./following-sibling::ead:container[@type='reel']">
                                            <xsl:copy-of select="$folder-reel-heading"/>
                                        </xsl:if>

                                        <tr>
                                            <td width="10%">
                                                <xsl:apply-templates
                                                  select="self::ead:container[@type='Folder']"/>
                                            </td>
                                            <td width="10%">
                                                <xsl:apply-templates
                                                  select="following-sibling::ead:container[@type='reel-frame' or @type='reel']"
                                                />
                                            </td>
                                            <td width="55%">
                                                <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"/>
                                            </td>
                                            <td width="25%">
                                                <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"/>
                                            </td>
                                        </tr>
                                        <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                        <xsl:if
                                            test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                            <tr class="filenote">
                                                <td width="10%">&#x00A0;</td>
                                                <td width="10%">&#x00A0;</td>
                                                <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                </td>
                                                <td width="25%">&#x00A0;</td>
                                            </tr>
                                        </xsl:if>
                                        <!-- edit end -->
                                    </xsl:when>

                                    <xsl:otherwise> </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                        </xsl:for-each>

                        <!-- c04 -->

                        <xsl:variable name="c04title">
                            <xsl:value-of select="ead:c04/ead:did/ead:unittitle"/>
                        </xsl:variable>

                        <xsl:for-each select="ead:c04">
                            <!-- the title of the 'section' without comma after "unittitle" -->
                            <xsl:choose>
                                <xsl:when test="@otherlevel='section' or @otherlevel='subsubseries'">
                                    <tr>
                                        <td colspan="4">
                                            <h4 class="section">
                                                <xsl:apply-templates select="ead:did/ead:unittitle"
                                                />
                                            </h4>
                                        </td>
                                    </tr>
                                </xsl:when>

                                <xsl:when
                                    test="@level='c04title' or @level='subseries' or contains($c04title, 'Subseries')">
                                    <tr>
                                        <td colspan="4">
                                            <h4><xsl:apply-templates select="ead:did/ead:unittitle"
                                                />,&#x00A0; <xsl:for-each
                                                  select="ead:did/ead:unitdate">
                                                  <xsl:apply-templates/>
                                                </xsl:for-each>. </h4>
                                        </td>
                                    </tr>

                                    <!-- physdesc and langmaterial changed by sp on 2004/05/05 -->
                                    <xsl:if test="ead:did/ead:langmaterial">
                                        <tr>
                                            <td colspan="4" class="physlang">
                                                <xsl:apply-templates
                                                  select="ead:did/ead:langmaterial"/>
                                            </td>
                                        </tr>
                                    </xsl:if>

                                    <xsl:if test="ead:did/ead:physdesc">
                                        <tr>
                                            <td colspan="4" class="physlang">
                                                <xsl:apply-templates select="ead:did/ead:physdesc"/>
                                            </td>
                                        </tr>
                                    </xsl:if>

                                    <xsl:if test="ead:did/ead:abstract">
                                        <tr>
                                            <td colspan="4">
                                                <p class="componentnote">
                                                  <xsl:apply-templates
                                                  select="ead:did/ead:abstract"/>
                                                </p>
                                            </td>
                                        </tr>
                                    </xsl:if>

                                    <xsl:if test="./child::arrangement">
                                        <tr>
                                            <td colspan="4">
                                                <h5 class="componentnote">Arrangement:</h5>
                                                <xsl:for-each select="ead:arrangement/ead:p">
                                                  <p class="componentnote">
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                </xsl:for-each>
                                            </td>
                                        </tr>
                                    </xsl:if>

                                    <xsl:if test="./child::ead:scopecontent">
                                        <tr>
                                            <td colspan="4">
                                                <h5 class="componentnote">Scope and Content:</h5>
                                                <xsl:for-each select="ead:scopecontent/ead:p">
                                                  <p class="componentnote">
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                </xsl:for-each>
                                            </td>
                                        </tr>
                                    </xsl:if>

                                    <xsl:if
                                        test="./child::ead:userestrict | ./child::ead:accessrestrict">
                                        <tr>
                                            <td colspan="4">
                                                <h5 class="componentnote">Restrictions:</h5>
                                                <xsl:for-each
                                                  select="ead:userestrict/ead:p | ead:accessrestrict/ead:p">
                                                  <p class="componentnote">
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                </xsl:for-each>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                </xsl:when>

                                <xsl:otherwise>
                                    <!-- do nothing be happy-->
                                </xsl:otherwise>
                            </xsl:choose>

                            <xsl:for-each select="ead:did/ead:container">
                                <xsl:variable name="c04-box-number"
                                    select="self::ead:container[@type='Box']"/>
                                <!-- lots of ugly tree-climbing here but this determines in a succinct fashion whether to render the container header -->

                                <xsl:if test="@type='Box'">
                                    <xsl:choose>
                                        <xsl:when
                                            test="not(../../preceding-sibling::ead:c04/ead:did[ead:container[@type='Box']=$c04-box-number]
                                            or ../preceding-sibling::ead:c04/ead:did[ead:container[@type='Box']=$c04-box-number])">

                                            <xsl:if
                                                test="./following-sibling::ead:container[@type='Folder']">
                                                <xsl:copy-of select="$box-and-folder-heading"/>
                                            </xsl:if>

                                            <xsl:if
                                                test="./following-sibling::ead:container[@type='item']">
                                                <xsl:copy-of select="$box-and-item-heading"/>
                                            </xsl:if>

                                            <xsl:if
                                                test="not(./following-sibling::ead:container[@type='Folder']
 or ./following-sibling::ead:container[@type='item'])">
                                                <xsl:copy-of select="$box-heading"/>
                                            </xsl:if>

                                            <xsl:if
                                                test="./following-sibling::ead:container[@type='Folder']">
                                                <tr>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"
                                                  />
                                                  </td>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:container[@type='Folder']"
                                                  />
                                                  </td>
                                                  <td width="55%">
                                                  <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"/>
                                                  </td>
                                                  <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"/>
                                                  </td>
                                                </tr>
                                                <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                                <xsl:if
                                                  test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates select="."
                                                  />
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                  </tr>
                                                </xsl:if>
                                                <!-- edit end -->
                                            </xsl:if>

                                            <xsl:if
                                                test="./following-sibling::ead:container[@type='item']">
                                                <tr>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"
                                                  />
                                                  </td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:container[@type='item']"
                                                  />
                                                  </td>
                                                  <!--<td width="40%"><xsl:apply-templates select="preceding-sibling::ead:unittitle"/></td>-->
                                                  <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"/>
                                                  </td>
                                                </tr>
                                                <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                                <xsl:if
                                                  test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates select="."
                                                  />
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                  </tr>
                                                </xsl:if>
                                                <!-- edit end -->
                                            </xsl:if>

                                            <xsl:if test="not(./following-sibling::ead:container)">
                                                <tr>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"
                                                  />
                                                  </td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"/>
                                                  </td>
                                                  <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"/>
                                                  </td>
                                                </tr>
                                                <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                                <xsl:if
                                                  test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates select="."
                                                  />
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                  </tr>
                                                </xsl:if>
                                                <!-- edit end -->
                                            </xsl:if>
                                        </xsl:when>

                                        <xsl:otherwise>
                                            <!-- add no header (because they belong to the same box), but still number boxes, since we like repeated box numbers -->
                                            <!-- to remove repeated box numbers replace the first td's contents with the hex for a nbsp -->

                                            <xsl:if
                                                test="./following-sibling::ead:container[@type='Folder']">
                                                <tr>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"
                                                  />
                                                  </td>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:container[@type='Folder']"
                                                  />
                                                  </td>
                                                  <td width="55%">
                                                  <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"/>
                                                  </td>
                                                  <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"/>
                                                  </td>
                                                </tr>
                                                <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                                <xsl:if
                                                  test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates select="."
                                                  />
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                  </tr>
                                                </xsl:if>
                                                <!-- edit end -->
                                            </xsl:if>

                                            <!-- test to see if it is a freestanding box without any folders etc within -->
                                            <xsl:if test="not(./following-sibling::ead:container)">
                                                <tr>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"
                                                  />
                                                  </td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"/>
                                                  </td>
                                                  <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"/>
                                                  </td>
                                                </tr>
                                                <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                                <xsl:if
                                                  test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates select="."
                                                  />
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                  </tr>
                                                </xsl:if>
                                                <!-- edit end -->
                                            </xsl:if>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                                <!-- end it is a box with whatever contents-->

                                <!-- here test to see whether we have a free-standing reel or folder with various contents -->
                                <xsl:if
                                    test="@type='reel' and not(./preceding-sibling::ead:container[@type='Box']) and not(./preceding-sibling::ead:container[@type='Folder'])">
                                    <xsl:copy-of select="$reel-heading"/>
                                    <tr>
                                        <td width="10%">
                                            <xsl:apply-templates
                                                select="self::ead:container[@type='reel']"/>
                                        </td>
                                        <td width="10%">&#x00A0;</td>
                                        <td width="55%">
                                            <xsl:apply-templates
                                                select="preceding-sibling::ead:unittitle"/>
                                        </td>
                                        <td width="25%">
                                            <xsl:apply-templates
                                                select="following-sibling::ead:unitdate"/>
                                        </td>
                                    </tr>
                                    <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                    <xsl:if
                                        test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                        <tr class="filenote">
                                            <td width="10%">&#x00A0;</td>
                                            <td width="10%">&#x00A0;</td>
                                            <td width="55%">
                                                <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                </xsl:for-each>
                                                <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                </xsl:if>
                                                <xsl:if test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                </xsl:if>
                                            </td>
                                            <td width="25%">&#x00A0;</td>
                                        </tr>
                                    </xsl:if>
                                    <!-- edit end -->
                                </xsl:if>

                                <!-- this is for collections which do not have boxes, but refer to folder and reel/frames of microfilm - yivo -->

                                <xsl:if test="@type='Folder'">
                                    <xsl:choose>
                                        <xsl:when
                                            test="not(../preceding-sibling::ead:c04/ead:did[ead:container[@type='Folder']=$folder-heading]
 or ./preceding-sibling::ead:container[@type='Box'])">

                                            <xsl:if test="not(./following-sibling::ead:container)">
                                                <xsl:copy-of select="$folder-heading"/>
                                            </xsl:if>

                                            <xsl:if
                                                test="./following-sibling::ead:container[@type='reel-frame']">
                                                <xsl:copy-of select="$folder-reel-frame-heading"/>
                                            </xsl:if>

                                            <xsl:if
                                                test="./following-sibling::ead:container[@type='reel']">
                                                <xsl:copy-of select="$folder-reel-heading"/>
                                            </xsl:if>

                                            <tr>
                                                <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='Folder']"
                                                  />
                                                </td>
                                                <td width="10%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:container[@type='reel-frame' or @type='reel']"
                                                  />
                                                </td>
                                                <td width="55%">
                                                  <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"/>
                                                </td>
                                                <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"/>
                                                </td>
                                            </tr>
                                            <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                            <xsl:if
                                                test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates select="."
                                                  />
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                </tr>
                                            </xsl:if>
                                            <!-- edit end -->
                                        </xsl:when>

                                        <xsl:otherwise>
                                            <!-- do nothing be happy -->
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                            </xsl:for-each>

                            <!-- c05 -->
                            <xsl:variable name="c05title">
                                <xsl:value-of select="ead:c05/ead:did/ead:unittitle"/>
                            </xsl:variable>

                            <xsl:for-each select="ead:c05">
                                <xsl:choose>
                                    <xsl:when test="@level='otherlevel' and child::ead:c06">
                                        <tr>
                                            <td colspan="4">
                                                <h4 class="section">
                                                  <xsl:apply-templates
                                                  select="ead:did/ead:unittitle"/>
                                                </h4>
                                            </td>
                                        </tr>
                                    </xsl:when>

                                    <xsl:when
                                        test="@level='c05title' or contains($c05title, 'Subseries')">
                                        <tr>
                                            <td colspan="4">
                                                <h4><xsl:apply-templates
                                                  select="ead:did/ead:unittitle"
                                                  />,&#x00A0; <xsl:for-each
                                                  select="ead:did/ead:unitdate">
                                                  <xsl:apply-templates/>
                                                  </xsl:for-each>. </h4>
                                            </td>
                                        </tr>

                                        <!-- physdesc and langmaterial changed by sp on 2004/05/05 -->
                                        <xsl:if test="ead:did/ead:langmaterial">
                                            <tr>
                                                <td colspan="4" class="physlang">
                                                  <xsl:apply-templates
                                                  select="ead:did/ead:langmaterial"/>
                                                </td>
                                            </tr>
                                        </xsl:if>

                                        <xsl:if test="ead:did/ead:physdesc">
                                            <tr>
                                                <td colspan="4" class="physlang">
                                                  <xsl:apply-templates
                                                  select="ead:did/ead:physdesc"/>
                                                </td>
                                            </tr>
                                        </xsl:if>

                                        <xsl:if test="ead:did/ead:abstract">
                                            <tr>
                                                <td colspan="4">
                                                  <p class="componentnote">
                                                  <xsl:apply-templates
                                                  select="ead:did/ead:abstract"/>
                                                  </p>
                                                </td>
                                            </tr>
                                        </xsl:if>

                                        <xsl:if test="./child::arrangement">
                                            <tr>
                                                <td colspan="4">
                                                  <h5 class="componentnote">Arrangement:</h5>
                                                  <xsl:for-each select="ead:arrangement/ead:p">
                                                  <p class="componentnote">
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                </td>
                                            </tr>
                                        </xsl:if>

                                        <xsl:if test="./child::ead:scopecontent">
                                            <tr>
                                                <td colspan="4">
                                                  <h5 class="componentnote">Scope and Content:</h5>
                                                  <xsl:for-each select="ead:scopecontent/ead:p">
                                                  <p class="componentnote">
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                </td>
                                            </tr>
                                        </xsl:if>

                                        <xsl:if
                                            test="./child::ead:userestrict | ./child::ead:accessrestrict">
                                            <tr>
                                                <td colspan="4">
                                                  <h5 class="componentnote">Restrictions:</h5>
                                                  <xsl:for-each
                                                  select="ead:userestrict/ead:p | ead:accessrestrict/ead:p">
                                                  <p class="componentnote">
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                </td>
                                            </tr>
                                        </xsl:if>
                                    </xsl:when>

                                    <xsl:otherwise>
                                        <!-- do nothing be happy-->
                                    </xsl:otherwise>
                                </xsl:choose>

                                <xsl:for-each select="ead:did/ead:container">
                                    <xsl:variable name="c05-box-number"
                                        select="self::ead:container[@type='Box']"/>

                                    <!-- lots of ugly tree-climbing here but this determines in a succinct fashion whether to render the container header -->

                                    <xsl:if test="@type='Box'">
                                        <xsl:choose>
                                            <xsl:when
                                                test="not(../../preceding-sibling::ead:c05/ead:did[ead:container[@type='Box']=$c05-box-number] or
                                                ../preceding-sibling::ead:c05/ead:did[ead:container[@type='Box']=$c05-box-number])
                                                or ../../preceding-sibling::ead:c05/ead:did[ead:container[@type='volume']]">

                                                <xsl:if
                                                  test="./following-sibling::ead:container[@type='Folder']">
                                                  <xsl:copy-of select="$box-and-folder-heading"/>
                                                </xsl:if>

                                                <xsl:if
                                                  test="./following-sibling::ead:container[@type='item']">
                                                  <xsl:copy-of select="$box-and-item-heading"/>
                                                </xsl:if>

                                                <xsl:if
                                                  test="not(./following-sibling::ead:container[@type='Folder']
or ./following-sibling::ead:container[@type='item'])">
                                                  <xsl:copy-of select="$box-heading"/>
                                                </xsl:if>

                                                <xsl:if
                                                  test="./following-sibling::ead:container[@type='Folder']">
                                                  <tr>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"
                                                  />
                                                  </td>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:container[@type='Folder']"
                                                  />
                                                  </td>
                                                  <td width="55%">
                                                  <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"
                                                  />
                                                  </td>
                                                  <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"
                                                  />
                                                  </td>
                                                  </tr>
                                                  <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                                  <xsl:if
                                                  test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                  </tr>
                                                  </xsl:if>
                                                  <!-- edit end -->
                                                </xsl:if>

                                                <xsl:if
                                                  test="./following-sibling::ead:container[@type='item']">
                                                  <tr>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"
                                                  />
                                                  </td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:container[@type='item']"
                                                  />
                                                  </td>
                                                  <!--<td width="40%"><xsl:apply-templates select="preceding-sibling::ead:unittitle"/></td>-->
                                                  <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"
                                                  />
                                                  </td>
                                                  </tr>
                                                  <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                                  <xsl:if
                                                  test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                  </tr>
                                                  </xsl:if>
                                                  <!-- edit end -->
                                                </xsl:if>

                                                <xsl:if
                                                  test="not(./following-sibling::ead:container)">
                                                  <tr>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"
                                                  />
                                                  </td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"
                                                  />
                                                  </td>
                                                  <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"
                                                  />
                                                  </td>
                                                  </tr>
                                                  <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                                  <xsl:if
                                                  test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                  </tr>
                                                  </xsl:if>
                                                  <!-- edit end -->
                                                </xsl:if>
                                            </xsl:when>

                                            <xsl:otherwise>
                                                <!-- add no header (because they belong to the same box), but still number boxes, since we like repeated box numbers -->
                                                <!-- to remove repeated box numbers replace the first td's contents with the hex for a nbsp -->
                                                <xsl:if
                                                  test="./following-sibling::ead:container[@type='Folder']">
                                                  <tr>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"
                                                  />
                                                  </td>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:container[@type='Folder']"
                                                  />
                                                  </td>
                                                  <td width="55%">
                                                  <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"
                                                  />
                                                  </td>
                                                  <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"
                                                  />
                                                  </td>
                                                  </tr>
                                                  <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                                  <xsl:if
                                                  test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                  </tr>
                                                  </xsl:if>
                                                  <!-- edit end -->
                                                </xsl:if>

                                                <!-- test to see if it is a freestanding box without any folders etc within -->
                                                <xsl:if
                                                  test="not(./following-sibling::ead:container)">
                                                  <tr>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"
                                                  />
                                                  </td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"
                                                  />
                                                  </td>
                                                  <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"
                                                  />
                                                  </td>
                                                  </tr>
                                                  <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                                  <xsl:if
                                                  test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                  </tr>
                                                  </xsl:if>
                                                  <!-- edit end -->
                                                </xsl:if>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:if>
                                    <!-- end it is a box with whatever contents-->

                                    <!-- here test to see whether we have a free-standing reel or folder with various contents -->
                                    <xsl:if
                                        test="@type='reel' and not(./preceding-sibling::ead:container[@type='Box']) and not(./preceding-sibling::ead:container[@type='Folder'])">
                                        <xsl:copy-of select="$reel-heading"/>
                                        <tr>
                                            <td width="10%">
                                                <xsl:apply-templates
                                                  select="self::ead:container[@type='reel']"/>
                                            </td>
                                            <td width="10%">&#x00A0;</td>
                                            <td width="55%">
                                                <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"/>
                                            </td>
                                            <td width="25%">
                                                <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"/>
                                            </td>
                                        </tr>
                                    </xsl:if>

                                    <!-- this is for collections which do not have boxes, but refer to folder and reel/frames of microfilm - yivo -->

                                    <xsl:if test="@type='Folder'">
                                        <xsl:choose>
                                            <xsl:when
                                                test="not(../preceding-sibling::ead:c04/ead:did[ead:container[@type='Folder']=$folder-heading]
 or ./preceding-sibling::ead:container[@type='Box'])">

                                                <xsl:if
                                                  test="not(./following-sibling::ead:container)">
                                                  <xsl:copy-of select="$folder-heading"/>
                                                </xsl:if>

                                                <xsl:if
                                                  test="./following-sibling::ead:container[@type='reel-frame']">
                                                  <xsl:copy-of select="$folder-reel-frame-heading"
                                                  />
                                                </xsl:if>

                                                <xsl:if
                                                  test="./following-sibling::ead:container[@type='reel']">
                                                  <xsl:copy-of select="$folder-reel-heading"/>
                                                </xsl:if>

                                                <tr>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='Folder']"
                                                  />
                                                  </td>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:container[@type='reel-frame' or @type='reel']"
                                                  />
                                                  </td>
                                                  <td width="55%">
                                                  <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"/>
                                                  </td>
                                                  <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"/>
                                                  </td>
                                                </tr>
                                                <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                                <xsl:if
                                                  test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates select="."
                                                  />
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                  </tr>
                                                </xsl:if>
                                                <!-- edit end -->
                                            </xsl:when>

                                            <xsl:otherwise> </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:if>
                                </xsl:for-each>

                                <!-- c06 -->

                                <xsl:variable name="c06title">
                                    <xsl:value-of select="ead:c06/ead:did/ead:unittitle"/>
                                </xsl:variable>

                                <xsl:for-each select="ead:c06">
                                    <xsl:choose>
                                        <xsl:when
                                            test="@level='c06title' or contains($c06title, 'Subseries')">
                                            <tr>
                                                <td colspan="4">
                                                  <h4><xsl:apply-templates
                                                  select="ead:did/ead:unittitle"
                                                  />,&#x00A0; <xsl:for-each
                                                  select="ead:did/ead:unitdate">
                                                  <xsl:apply-templates/>
                                                  </xsl:for-each>. </h4>
                                                </td>
                                            </tr>

                                            <!-- physdesc and langmaterial changed by sp on 2004/05/05 -->
                                            <xsl:if test="ead:did/ead:langmaterial">
                                                <tr>
                                                  <td colspan="4" class="physlang">
                                                  <xsl:apply-templates
                                                  select="ead:did/ead:langmaterial"/>
                                                  </td>
                                                </tr>
                                            </xsl:if>

                                            <xsl:if test="ead:did/ead:physdesc">
                                                <tr>
                                                  <td colspan="4" class="physlang">
                                                  <xsl:apply-templates
                                                  select="ead:did/ead:physdesc"/>
                                                  </td>
                                                </tr>
                                            </xsl:if>

                                            <xsl:if test="ead:did/ead:abstract">
                                                <tr>
                                                  <td colspan="4">
                                                  <p class="componentnote">
                                                  <xsl:apply-templates
                                                  select="ead:did/ead:abstract"/>
                                                  </p>
                                                  </td>
                                                </tr>
                                            </xsl:if>

                                            <xsl:if test="./child::arrangement">
                                                <tr>
                                                  <td colspan="4">
                                                  <h5 class="componentnote">Arrangement:</h5>
                                                  <xsl:for-each select="ead:arrangement/ead:p">
                                                  <p class="componentnote">
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </td>
                                                </tr>
                                            </xsl:if>

                                            <xsl:if test="./child::ead:scopecontent">
                                                <tr>
                                                  <td colspan="4">
                                                  <h5 class="componentnote">Scope and Content:</h5>
                                                  <xsl:for-each
                                                  select="ead:scopecontent/ead:p">
                                                  <p class="componentnote">
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </td>
                                                </tr>
                                            </xsl:if>

                                            <xsl:if
                                                test="./child::ead:userestrict | ./child::ead:accessrestrict">
                                                <tr>
                                                  <td colspan="4">
                                                  <h5 class="componentnote">Restrictions:</h5>
                                                  <xsl:for-each
                                                  select="ead:userestrict/ead:p | ead:accessrestrict/ead:p">
                                                  <p class="componentnote">
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </td>
                                                </tr>
                                            </xsl:if>
                                        </xsl:when>

                                        <xsl:otherwise>
                                            <!-- do nothing be happy-->
                                        </xsl:otherwise>
                                    </xsl:choose>

                                    <xsl:for-each select="ead:did/ead:container">
                                        <xsl:variable name="c06-box-number"
                                            select="self::ead:container[@type='Box']"/>
                                        <!-- lots of ugly tree-climbing here but this determines in a succinct fashion whether to render the container header -->

                                        <xsl:if test="@type='Box'">
                                            <xsl:choose>
                                                <xsl:when
                                                    test="not(../../preceding-sibling::ead:c06/ead:did[ead:container[@type='Box']=$c06-box-number] or
                                                    ../preceding-sibling::ead:c06/ead:did[ead:container[@type='Box']=$c06-box-number])">

                                                  <xsl:if
                                                  test="./following-sibling::ead:container[@type='Folder']">
                                                  <xsl:copy-of
                                                  select="$box-and-folder-heading"/>
                                                  </xsl:if>

                                                  <xsl:if
                                                  test="./following-sibling::ead:container[@type='item']">
                                                  <xsl:copy-of select="$box-and-item-heading"
                                                  />
                                                  </xsl:if>

                                                  <xsl:if
                                                  test="not(./following-sibling::ead:container[@type='Folder']
or ./following-sibling::ead:container[@type='item'])">
                                                  <xsl:copy-of select="$box-heading"/>
                                                  </xsl:if>

                                                  <xsl:if
                                                  test="./following-sibling::ead:container[@type='Folder']">
                                                  <tr>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"
                                                  />
                                                  </td>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:container[@type='Folder']"
                                                  />
                                                  </td>
                                                  <td width="55%">
                                                  <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"
                                                  />
                                                  </td>
                                                  <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"
                                                  />
                                                  </td>
                                                  </tr>
                                                  <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                                  <xsl:if
                                                  test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                  </tr>
                                                  </xsl:if>
                                                  <!-- edit end -->
                                                  </xsl:if>

                                                  <xsl:if
                                                  test="./following-sibling::ead:container[@type='item']">
                                                  <tr>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"
                                                  />
                                                  </td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:container[@type='item']"
                                                  />
                                                  </td>
                                                  <!--<td width="40%"><xsl:apply-templates select="preceding-sibling::ead:unittitle"/></td>-->
                                                  <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"
                                                  />
                                                  </td>
                                                  </tr>
                                                  <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                                  <xsl:if
                                                  test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                  </tr>
                                                  </xsl:if>
                                                  <!-- edit end -->
                                                  </xsl:if>

                                                  <xsl:if
                                                  test="not(./following-sibling::ead:container)">
                                                  <tr>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"
                                                  />
                                                  </td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"
                                                  />
                                                  </td>
                                                  <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"
                                                  />
                                                  </td>
                                                  </tr>
                                                  <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                                  <xsl:if
                                                  test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                  </tr>
                                                  </xsl:if>
                                                  <!-- edit end -->
                                                  </xsl:if>
                                                </xsl:when>

                                                <xsl:otherwise>
                                                  <!-- add no header (because they belong to the same box), but still number boxes, since we like repeated box numbers -->
                                                  <!-- to remove repeated box numbers replace the first td's contents with the hex for a nbsp -->
                                                  <xsl:if
                                                  test="./following-sibling::ead:container[@type='Folder']">
                                                  <tr>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"
                                                  />
                                                  </td>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:container[@type='Folder']"
                                                  />
                                                  </td>
                                                  <td width="55%">
                                                  <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"
                                                  />
                                                  </td>
                                                  <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"
                                                  />
                                                  </td>
                                                  </tr>
                                                  <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                                  <xsl:if
                                                  test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                  </tr>
                                                  </xsl:if>
                                                  <!-- edit end -->
                                                  </xsl:if>

                                                  <!-- test to see if it is a freestanding box without any folders etc within -->
                                                  <xsl:if
                                                  test="not(./following-sibling::ead:container)">
                                                  <tr>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='Box']"
                                                  />
                                                  </td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"
                                                  />
                                                  </td>
                                                  <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"
                                                  />
                                                  </td>
                                                  </tr>
                                                  <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                                  <xsl:if
                                                  test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                  </tr>
                                                  </xsl:if>
                                                  <!-- edit end -->
                                                  </xsl:if>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:if>
                                        <!-- end it is a box with whatever contents-->

                                        <!-- here test to see whether we have a free-standing reel or folder with various contents -->
                                        <xsl:if
                                            test="@type='reel' and not(./preceding-sibling::ead:container[@type='Box']) and not(./preceding-sibling::ead:container[@type='Folder'])">
                                            <xsl:copy-of select="$reel-heading"/>
                                            <tr>
                                                <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='reel']"/>
                                                </td>
                                                <td width="10%">&#x00A0;</td>
                                                <td width="55%">
                                                  <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"/>
                                                </td>
                                                <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"/>
                                                </td>
                                            </tr>
                                            <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                            <xsl:if
                                                test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates select="."
                                                  />
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                </tr>
                                            </xsl:if>
                                            <!-- edit end -->
                                        </xsl:if>

                                        <!-- this is for collections which do not have boxes, but refer to folder and reel/frames of microfilm - yivo -->

                                        <xsl:if test="@type='Folder'">
                                            <xsl:choose>
                                                <xsl:when
                                                    test="not(../preceding-sibling::ead:c02/ead:did[ead:container[@type='Folder']=$folder-heading]
 or ./preceding-sibling::ead:container[@type='Box'])">

                                                  <xsl:if
                                                  test="not(./following-sibling::ead:container)">
                                                  <xsl:copy-of select="$folder-heading"/>
                                                  </xsl:if>

                                                  <xsl:if
                                                  test="./following-sibling::ead:container[@type='reel-frame']">
                                                  <xsl:copy-of
                                                  select="$folder-reel-frame-heading"/>
                                                  </xsl:if>

                                                  <xsl:if
                                                  test="./following-sibling::ead:container[@type='reel']">
                                                  <xsl:copy-of select="$folder-reel-heading"/>
                                                  </xsl:if>

                                                  <tr>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="self::ead:container[@type='Folder']"
                                                  />
                                                  </td>
                                                  <td width="10%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:container[@type='reel-frame' or @type='reel']"
                                                  />
                                                  </td>
                                                  <td width="55%">
                                                  <xsl:apply-templates
                                                  select="preceding-sibling::ead:unittitle"
                                                  />
                                                  </td>
                                                  <td width="25%">
                                                  <xsl:apply-templates
                                                  select="following-sibling::ead:unitdate"
                                                  />
                                                  </td>
                                                  </tr>
                                                  <!-- added scopecontent note, physical description, and other elements on the folder level by sp 2005/04/01, note by sp 2005/09/21 -->
                                                  <xsl:if
                                                  test="./following-sibling::physdesc|./following-sibling::langmaterial|./following-sibling::note|../following-sibling::scopecontent|../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <tr class="filenote">
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="10%">&#x00A0;</td>
                                                  <td width="55%">
                                                  <xsl:for-each
                                                  select="../following-sibling::scopecontent/p|./following-sibling::note/p ">
                                                  <p class="filenote">
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  <xsl:if
                                                  test="../following-sibling::ead:scopecontent/ead:list">
                                                  <ul class="filelist">
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/head"/>
                                                  <xsl:apply-templates
                                                  select="../following-sibling::scopecontent/list/item"
                                                  />
                                                  </ul>
                                                  </xsl:if>
                                                  <xsl:if
                                                  test="following-sibling::ead:langmaterial">
                                                  <xsl:apply-templates
                                                  select="./following-sibling::ead:langmaterial"
                                                  />&#x00A0; </xsl:if>
                                                  <xsl:apply-templates
                                                  select="./following-sibling::physdesc"/>
                                                  <xsl:if
                                                  test="../following-sibling::accessrestrict|../following-sibling::userestrict">
                                                  <xsl:for-each
                                                  select="../following-sibling::ead:accessrestrict/ead:p|../following-sibling::ead:userestrict/ead:p">
                                                  <p>
                                                  <xsl:apply-templates
                                                  select="."/>
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:if>
                                                  </td>
                                                  <td width="25%">&#x00A0;</td>
                                                  </tr>
                                                  </xsl:if>
                                                  <!-- edit end -->
                                                </xsl:when>

                                                <xsl:otherwise>
                                                  <!-- do nothing be happy -->
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:if>
                                    </xsl:for-each>

                                    <!-- c06 end -->

                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:for-each>
                </xsl:for-each>
            </table>
<a class="return" href="#a0">Return to the Top of Page</a>
<hr />
</xsl:for-each>
 </xsl:template> 
        
        <xsl:template name="controlAccess">
            
            <ul class="controlaccess">
                
                <li><h3 class="subjecthead">
                    <xsl:choose>
                        <xsl:when test="ead:head"><xsl:apply-templates/></xsl:when>
                        <xsl:otherwise>
                            Controlled Access Headings
                        </xsl:otherwise>
                    </xsl:choose>
                </h3>
                    <xsl:if test="ead:corpname">
                        <h4>Corporate Name(s)</h4>
                        <ul>
                            <xsl:for-each select="ead:corpname">
                                <li><xsl:apply-templates/> </li>
                            </xsl:for-each>
                        </ul>            
                    </xsl:if>
                    <xsl:if test="ead:famname">
                        <h4>Family Name(s)</h4>
                        <ul>
                            <xsl:for-each select="ead:famname">
                                <li><xsl:apply-templates/> </li>
                            </xsl:for-each>                        
                        </ul>
                    </xsl:if>
                    <xsl:if test="ead:function">
                        <h4>Function(s)</h4>
                        <ul>
                            <xsl:for-each select="ead:function">
                                <li><xsl:apply-templates/> </li>
                            </xsl:for-each>                        
                        </ul>
                    </xsl:if>
                    <xsl:if test="ead:genreform">
                        <h4>Genre(s)</h4>
                        <ul>
                            <xsl:for-each select="ead:genreform">
                                <li><xsl:apply-templates/> </li>
                            </xsl:for-each>
                        </ul>     
                    </xsl:if>
                    <xsl:if test="ead:geogname">
                        <h4>Geographic Name(s)</h4>
                        <ul>
                            <xsl:for-each select="ead:geogname">
                                <li><xsl:apply-templates/> </li>
                            </xsl:for-each>                        
                        </ul>
                    </xsl:if>
                    <xsl:if test="ead:occupation">
                        <h4>Occupation(s)</h4>
                        <ul>
                            <xsl:for-each select="ead:occupation">
                                <li><xsl:apply-templates/> </li>
                            </xsl:for-each>                        
                        </ul>
                    </xsl:if>
                    <xsl:if test="ead:persname">
                        <h4>Personal Name(s)</h4>
                        <ul>
                            <xsl:for-each select="ead:persname">
                                <li><xsl:apply-templates/> </li>
                            </xsl:for-each>                        
                        </ul>
                    </xsl:if>
                    <xsl:if test="ead:subject">
                        <h4>Subject(s)</h4>
                        <ul>
                            <xsl:for-each select="ead:subject">
                                <li><xsl:apply-templates/> </li>
                            </xsl:for-each>                        
                        </ul>
                    </xsl:if>
                </li>
            </ul>
            
        </xsl:template>

        
        <!-- this section was rewritten - we used the 2004 version of NYU stylesheet and adopted some of our modifications by sp 2004-04-16 -->
        <!-- <xsl:include href="containerlist.xsl"/> -->
        <!--
            <xsl:template name="dsc">
            </xsl:template>
        -->
    </xsl:stylesheet>