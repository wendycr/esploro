<?xml version="1.0" encoding="UTF-8"?>

<!-- Modified from the xsl to convert from Digital Commons format -->
<!-- delete  xmlns="http://www.openarchives.org/OAI/2.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd"
 and  xmlns="http://www.loc.gov/MARC21/slim" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd"
 replacing with nothing before running the xsl -->

<!-- Create a set with the records then reuqest Esploro for Primo OAI output from systems librarian -->

<xsl:stylesheet version="2.0" 
    xmlns="http://www.openarchives.org/OAI/2.0/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:marc="http://www.loc.gov/MARC21/slim" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:functx="http://www.functx.com" extension-element-prefixes="functx">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:preserve-space elements="text"/>
    
    <!-- If the organizations spreadsheet on sharepoint has been updated,resave it as xls and reimport as xml -->
    <xsl:variable name="lookupDoc" select="document('IRO_InternalOrganizations.xml')"/>   
    
    <!-- run analytics for file size and output as xml - remove code at top -->
    <xsl:variable name="lookupfilesize" select="document('ETD-filesize.xml')"/>   
    
    <!--functx to capitalize first word of keywords-->
    <xsl:function name="functx:capitalize-first" as="xs:string?"
        xmlns:functx="http://www.functx.com">
        <xsl:param name="arg" as="xs:string?"/>
        <xsl:sequence
            select=" 
            concat(upper-case(substring($arg,1,1)),
            substring($arg,2))
            "
        />
    </xsl:function>

    <xsl:template match="/">
        <!--   <xsl:result-document method="xml" href="{Graduate_last_name}-{position()}.xml" >   -->
        
        <marc:collection xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd">
            <xsl:for-each select="collection/OAI-PMH">
                
				<!-- remove the comment for the code to select for a cataloger and comment out the other code - repeat for all catalogers -->
                <xsl:variable name="depttest" select="ListRecords/record/metadata/record/units/unit/unitLevel[1]/code"/>
				<!-- Cataloger 1 -->
<!--				 <xsl:if test="$depttest='01IOWA_INST___1145' or $depttest='01IOWA_INST___1160' or $depttest='01IOWA_INST___1170' or $depttest='01IOWA_INST___14' or $depttest='01IOWA_INST___2530' or $depttest='01IOWA_INST___2540' or $depttest='01IOWA_INST___2550' or $depttest='01IOWA_INST___2560'"> 
-->				<!-- Cataloger 2 -->
<!--				 <xsl:if test="$depttest='01IOWA_INST___1020' or $depttest='01IOWA_INST___1090' or $depttest='01IOWA_INST___1190' or $depttest='01IOWA_INST___1200' or $depttest='01IOWA_INST___1260' or $depttest='01IOWA_INST___1290' or $depttest='01IOWA_INST___1300' or $depttest='01IOWA_INST___1310' or $depttest='01IOWA_INST___1340' or $depttest='01IOWA_INST___1350' or $depttest='01IOWA_INST___1400' or $depttest='01IOWA_INST___1500' or $depttest='01IOWA_INST___2020' or $depttest='01IOWA_INST___2105' or $depttest='01IOWA_INST___4230z1' or $depttest='01IOWA_INST___4250' or $depttest='01IOWA_INST___4260'"> 
-->				<!-- Cataloger 3 -->
<!--				 <xsl:if test="$depttest='01IOWA_INST___1000' or $depttest='01IOWA_INST___1010' or $depttest='01IOWA_INST___1030' or $depttest='01IOWA_INST___1080' or $depttest='01IOWA_INST___11' or $depttest='01IOWA_INST___1100' or $depttest='01IOWA_INST___1140' or $depttest='01IOWA_INST___1150' or $depttest='01IOWA_INST___1180' or $depttest='01IOWA_INST___1220' or $depttest='01IOWA_INST___1360' or $depttest='01IOWA_INST___1370' or $depttest='01IOWA_INST___1390' or $depttest='01IOWA_INST___1655' or $depttest='01IOWA_INST___4230z3'"> 
-->				<!-- Cataloger 4 -->
<!--				<xsl:if test="$depttest='01IOWA_INST___1130' or $depttest='01IOWA_INST___1240'"> 
-->                <!--  Cataloger 5 -->
<!--                <xsl:if test="$depttest='01IOWA_INST___1040' or $depttest='01IOWA_INST___1110' or $depttest='01IOWA_INST___1230' or $depttest='01IOWA_INST___1380' or $depttest='01IOWA_INST___2780' or $depttest='01IOWA_INST___2800' or $depttest='01IOWA_INST___2820' or $depttest='01IOWA_INST___2830' or $depttest='01IOWA_INST___4230z4' or $depttest='01IOWA_INST___4235' or $depttest='01IOWA_INST___5220'">   
-->				<!-- Cataloger6  -->
				 <xsl:if test="$depttest!='01IOWA_INST___1040' and $depttest!='01IOWA_INST___1110' and $depttest!='01IOWA_INST___1230' and $depttest!='01IOWA_INST___1380' and $depttest!='01IOWA_INST___2780' and $depttest!='01IOWA_INST___2800' and $depttest!='01IOWA_INST___2820' and $depttest!='01IOWA_INST___2830' and $depttest!='01IOWA_INST___4230z4' and $depttest!='01IOWA_INST___4235' and $depttest!='01IOWA_INST___5220' and $depttest!='01IOWA_INST___1145' and $depttest!='01IOWA_INST___1160' and $depttest!='01IOWA_INST___1170' and $depttest!='01IOWA_INST___14' and $depttest!='01IOWA_INST___2530' and $depttest!='01IOWA_INST___2540' and $depttest!='01IOWA_INST___2550' and $depttest!='01IOWA_INST___2560' and $depttest!='01IOWA_INST___1020' and $depttest!='01IOWA_INST___1090' and $depttest!='01IOWA_INST___1190' and $depttest!='01IOWA_INST___1200' and $depttest!='01IOWA_INST___1260' and $depttest!='01IOWA_INST___1290' and $depttest!='01IOWA_INST___1300' and $depttest!='01IOWA_INST___1310' and $depttest!='01IOWA_INST___1340' and $depttest!='01IOWA_INST___1350' and $depttest!='01IOWA_INST___1400' and $depttest!='01IOWA_INST___1500' and $depttest!='01IOWA_INST___2020' and $depttest!='01IOWA_INST___2105' and $depttest!='01IOWA_INST___4230z1' and $depttest!='01IOWA_INST___4250' and $depttest!='01IOWA_INST___4260' and $depttest!='01IOWA_INST___1000' and $depttest!='01IOWA_INST___1010' and $depttest!='01IOWA_INST___1030' and $depttest!='01IOWA_INST___1080' and $depttest!='01IOWA_INST___11' and $depttest!='01IOWA_INST___1100' and $depttest!='01IOWA_INST___1140' and $depttest!='01IOWA_INST___1150' and $depttest!='01IOWA_INST___1180' and $depttest!='01IOWA_INST___1220' and $depttest!='01IOWA_INST___1360' and $depttest!='01IOWA_INST___1370' and $depttest!='01IOWA_INST___1390' and $depttest!='01IOWA_INST___1655' and $depttest!='01IOWA_INST___4230z3' and $depttest!='01IOWA_INST___1130' and $depttest!='01IOWA_INST___1240'"> 
                
                <marc:record>
                    <xsl:variable name="date" select="ListRecords/record/metadata/record/data/date.degree"/>
                    <xsl:variable name="pages" select="ListRecords/record/metadata/record/data/pages"/>
                    <xsl:variable name="illustrations" select="ListRecords/record/metadata/record/data/description.illustrations"/>
                    <xsl:variable name="bibliographic" select="ListRecords/record/metadata/record/data/description.bibliographic"/>
                    <xsl:variable name="doi" select="ListRecords/record/metadata/record/data/identifier.doi"/>
                    
                    <marc:leader>
                        <xsl:text>     nam  22     Ii 4500</xsl:text>
                    </marc:leader>
                    <marc:controlfield tag="006">
                        <xsl:text>m     o  d        </xsl:text>
                    </marc:controlfield>
                    <marc:controlfield tag="007">
                        <xsl:text>cr n||||||||||</xsl:text>
                    </marc:controlfield>
                    

                    <marc:controlfield tag="008">
                        <xsl:text>      </xsl:text>
                        <xsl:choose>
                            <xsl:when test="string-length($date)=4">
                                <xsl:value-of select="concat('s', substring($date, 1, 4),'  ')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="concat('e', substring($date, 1, 4),substring($date, 5, 2))"/>
                            </xsl:otherwise>
                        </xsl:choose>
                        
                        <xsl:choose>
                            <xsl:when test="$illustrations!=''"> 
                                <xsl:text>  iaua   </xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>  iau    </xsl:text>
                            </xsl:otherwise>
                        </xsl:choose> 
                        
                        <xsl:choose>
                            <xsl:when test="$bibliographic!=''"> 
                                <xsl:text> obm</xsl:text>
                             </xsl:when>
                             <xsl:otherwise>
                                <xsl:text> om </xsl:text>
                             </xsl:otherwise>
                         </xsl:choose>                             
                        
                        <!--Will need to deal with multiple languages after an example is seen -->
                        <xsl:variable name="language" select="ListRecords/record/metadata/record/data/language[1]"/>
                        <xsl:choose>
                            <xsl:when test="$language='eng'">
                                <xsl:text>   000 0 eng d</xsl:text>
                            </xsl:when>
                            <xsl:when test="$language='fre'">
                                <xsl:text>   000 0 fre d</xsl:text>
                            </xsl:when>
                            <xsl:when test="$language='spa'">
                                <xsl:text>   000 0 spa d</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>   000 0 ??? d</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>                      
                    </marc:controlfield>
                    
                    <marc:datafield tag="024" ind1="7" ind2=" ">
                        <marc:subfield code="a">
                            <xsl:value-of select="normalize-space($doi)"/>
                        </marc:subfield>
                        <marc:subfield code="2">doi</marc:subfield>
                    </marc:datafield>
                   
                    <marc:datafield tag="040" ind1=" " ind2=" ">
                        <marc:subfield code="a">NUI</marc:subfield>
                        <marc:subfield code="b">eng</marc:subfield>
                        <marc:subfield code="e">rda</marc:subfield>
                        <marc:subfield code="c">NUI</marc:subfield>
                    </marc:datafield>
                    
                    <!-- if more than 3 language are used, will need to modify this Note that the languages are in ML in alphabetical order so the 041 may be in the incorrect order -->
                    <xsl:choose>
                        <xsl:when test="ListRecords/record/metadata/record/data/language[2]!=''">
                            <xsl:choose>
                                <xsl:when test="ListRecords/record/metadata/record/data/language[3]!=''">
                                    <marc:datafield tag="041" ind1=" " ind2="0">
                                        <marc:subfield code="a">
                                            <xsl:value-of select="ListRecords/record/metadata/record/data/language[1]"/>
                                        </marc:subfield>
                                        <marc:subfield code="a">
                                            <xsl:value-of select="ListRecords/record/metadata/record/data/language[2]"/>
                                        </marc:subfield>
                                        <marc:subfield code="a">
                                            <xsl:value-of select="ListRecords/record/metadata/record/data/language[3]"/>
                                        </marc:subfield>
                                    </marc:datafield>
                                </xsl:when>
                                <xsl:otherwise>
                                    <marc:datafield tag="041" ind1=" " ind2="0">
                                        <marc:subfield code="a">
                                            <xsl:value-of select="ListRecords/record/metadata/record/data/language[1]"/>
                                        </marc:subfield>
                                        <marc:subfield code="a">
                                            <xsl:value-of select="ListRecords/record/metadata/record/data/language[2]"/>
                                        </marc:subfield>
                                    </marc:datafield>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                    </xsl:choose>           
                    
                    <xsl:variable name="givenname" select="ListRecords/record/metadata/record/data/creators/creator/givenname"/>
                    <xsl:variable name="familyname" select="ListRecords/record/metadata/record/data/creators/creator/familyname"/>
                    <xsl:variable name="suffix" select="ListRecords/record/metadata/record/data/creators/creator/suffix"/>
                    
                    <marc:datafield tag="100" ind1="1" ind2=" ">
                        <xsl:variable name="suffix" select="$suffix"/>
                        <xsl:choose>
                            <xsl:when test="$suffix!=''">
                                <marc:subfield code="a">
                                    <xsl:variable name="givenname" select="$givenname"/>
                                    <xsl:variable name="familyname" select="$familyname"/>
                                    <xsl:value-of select="concat($familyname, ', ', $givenname,',')"/>
                                </marc:subfield>                               
                                <marc:subfield code="c">
                                    <xsl:value-of select="concat($suffix,',')"/>
                                </marc:subfield>
                            </xsl:when>
                            <xsl:otherwise>
                                <marc:subfield code="a">
                                    <xsl:variable name="givenname" select="$givenname"/>
                                    <xsl:variable name="familyname" select="$familyname"/>
                                    <xsl:value-of select="concat($familyname, ', ', $givenname,',')"/>
                                </marc:subfield>
                            </xsl:otherwise>
                        </xsl:choose>
                        <marc:subfield code="e">author.</marc:subfield>
                    </marc:datafield>

                    <xsl:variable name="title" select="ListRecords/record/metadata/record/data/title"/>
                    <xsl:choose>
                        <xsl:when test="ListRecords/record/metadata/record/data/title.subtitle!=''">                    
                            <xsl:choose>
                                <xsl:when test="substring($title, 1, 2)='A '">
                                    <marc:datafield tag="245" ind1="1" ind2="2">
                                        <marc:subfield code="a">
                                            <xsl:value-of select="normalize-space($title)"/>
                                        </marc:subfield>                    
                                        <marc:subfield code="b">
                                            <xsl:value-of select="normalize-space(concat(ListRecords/record/metadata/record/data/title.subtitle,' /'))"/>
                                        </marc:subfield>        
                                        <marc:subfield code="c">
                                            <xsl:choose>
                                                <xsl:when test="$suffix!=''">
                                                    <xsl:value-of select="concat('by ', $givenname, ' ', $familyname, ', ', $suffix, '.')"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="concat('by ', $givenname, ' ', $familyname, '.')"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </marc:subfield>
                                    </marc:datafield>
                                </xsl:when>
                                <xsl:when test="substring($title, 1, 3)='An '">
                                    <marc:datafield tag="245" ind1="1" ind2="3">
                                        <marc:subfield code="a">
                                            <xsl:value-of select="normalize-space($title)"/>
                                        </marc:subfield>                    
                                        <marc:subfield code="b">
                                            <xsl:value-of select="normalize-space(concat(ListRecords/record/metadata/record/data/title.subtitle,' /'))"/>
                                                </marc:subfield> 
                                        <marc:subfield code="c">
                                            <xsl:choose>
                                                <xsl:when test="$suffix!=''">
                                                    <xsl:value-of select="concat('by ', $givenname, ' ', $familyname, ', ', $suffix, '.')"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="concat('by ', $givenname, ' ', $familyname, '.')"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </marc:subfield>
                                    </marc:datafield>
                                </xsl:when>
                                <xsl:when test="substring($title, 1, 4)='The '">
                                    <marc:datafield tag="245" ind1="1" ind2="4">
                                        <marc:subfield code="a">
                                            <xsl:value-of select="normalize-space($title)"/>
                                        </marc:subfield>                    
                                        <marc:subfield code="b">
                                            <xsl:value-of select="normalize-space(concat(ListRecords/record/metadata/record/data/title.subtitle,' /'))"/>
                                        </marc:subfield> 
                                        <marc:subfield code="c">
                                            <xsl:choose>
                                                <xsl:when test="$suffix!=''">
                                                    <xsl:value-of select="concat('by ', $givenname, ' ', $familyname, ', ', $suffix, '.')"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="concat('by ', $givenname, ' ', $familyname, '.')"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </marc:subfield>
                                    </marc:datafield>
                                </xsl:when>
                                <xsl:otherwise>
                                    <marc:datafield tag="245" ind1="1" ind2="0">
                                        <marc:subfield code="a">
                                            <xsl:value-of select="normalize-space($title)"/>
                                        </marc:subfield>                    
                                        <marc:subfield code="b">
                                            <xsl:value-of select="normalize-space(concat(ListRecords/record/metadata/record/data/title.subtitle,' /'))"/>
                                        </marc:subfield>  
                                        <marc:subfield code="c">
                                            <xsl:choose>
                                                <xsl:when test="$suffix!=''">
                                                    <xsl:value-of select="concat('by ', $givenname, ' ', $familyname, ', ', $suffix, '.')"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="concat('by ', $givenname, ' ', $familyname, '.')"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </marc:subfield>
                                    </marc:datafield>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:choose>
                                <xsl:when test="substring($title, 1, 2)='A '">
                                    <marc:datafield tag="245" ind1="1" ind2="2">
                                        <marc:subfield code="a">
                                            <xsl:value-of select="normalize-space(concat($title,' /'))"/>
                                        </marc:subfield>                          
                                        <marc:subfield code="c">
                                            <xsl:choose>
                                                <xsl:when test="$suffix!=''">
                                                    <xsl:value-of select="concat('by ', $givenname, ' ', $familyname, ', ', $suffix, '.')"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="concat('by ', $givenname, ' ', $familyname, '.')"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </marc:subfield>
                                    </marc:datafield>
                                </xsl:when>
                                <xsl:when test="substring($title, 1, 3)='An '">
                                    <marc:datafield tag="245" ind1="1" ind2="3">
                                        <marc:subfield code="a">
                                            <xsl:value-of select="normalize-space(concat($title,' /'))"/>
                                        </marc:subfield>                     
                                        <marc:subfield code="c">
                                            <xsl:choose>
                                                <xsl:when test="$suffix!=''">
                                                    <xsl:value-of select="concat('by ', $givenname, ' ', $familyname, ', ', $suffix, '.')"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="concat('by ', $givenname, ' ', $familyname, '.')"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </marc:subfield>
                                    </marc:datafield>
                                </xsl:when>
                                <xsl:when test="substring($title, 1, 4)='The '">
                                    <marc:datafield tag="245" ind1="1" ind2="4">
                                        <marc:subfield code="a">
                                            <xsl:value-of select="normalize-space(concat($title,' /'))"/>
                                        </marc:subfield>                    
                                        <marc:subfield code="c">
                                            <xsl:choose>
                                                <xsl:when test="$suffix!=''">
                                                    <xsl:value-of select="concat('by ', $givenname, ' ', $familyname, ', ', $suffix, '.')"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="concat('by ', $givenname, ' ', $familyname, '.')"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </marc:subfield>
                                    </marc:datafield>
                                </xsl:when>
                                <xsl:otherwise>
                                    <marc:datafield tag="245" ind1="1" ind2="0">
                                        <marc:subfield code="a">
                                            <xsl:value-of select="normalize-space(concat($title,' /'))"/>
                                        </marc:subfield>                     
                                        <marc:subfield code="c">
                                            <xsl:choose>
                                                <xsl:when test="$suffix!=''">
                                                    <xsl:value-of select="concat('by ', $givenname, ' ', $familyname, ', ', $suffix, '.')"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="concat('by ', $givenname, ' ', $familyname, '.')"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </marc:subfield>
                                    </marc:datafield>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                    <marc:datafield tag="264" ind1=" " ind2="1">
                        <marc:subfield code="a">[Iowa City, Iowa] :</marc:subfield>
                        <marc:subfield code="b"><xsl:value-of select="concat(ListRecords/record/metadata/record/data/publisher,',')"/></marc:subfield>
                        <marc:subfield code="c">
                            <xsl:choose>
                                <xsl:when test="substring($date, 5, 2)='05'">
                                    <xsl:value-of select="concat('May ',substring($date, 1, 4), '.')"/>
                                </xsl:when>
                                <xsl:when test="substring($date, 5, 2)='07'">
                                    <xsl:value-of select="concat('July ',substring($date, 1, 4), '.')"/>
                                </xsl:when>
                                <xsl:when test="substring($date, 5, 2)='08'">
                                    <xsl:value-of select="concat('August ',substring($date, 1, 4), '.')"/>
                                </xsl:when>
                                <xsl:when test="substring($date, 5, 2)='12'">
                                    <xsl:value-of select="concat('December ',substring($date, 1, 4), '.')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="concat(substring($date, 1, 4), '.')"/>
                                </xsl:otherwise>
                            </xsl:choose>                      
                       </marc:subfield>
                    </marc:datafield>

                    <marc:datafield tag="300" ind1=" " ind2=" ">
                        <xsl:choose>
                            <xsl:when test="$illustrations!=''">
                              <marc:subfield code="a">
                                  <xsl:value-of select="concat('1 online resource',' (',$pages,') :')"/>
                              </marc:subfield>
                              <marc:subfield code="b">
                                  <xsl:value-of select="normalize-space($illustrations)"/>
                              </marc:subfield>  
                            </xsl:when>
                            <xsl:otherwise>
                                <marc:subfield code="a">
                                    <xsl:value-of select="concat('1 online resource',' (',$pages,')')"/>
                                </marc:subfield>
                            </xsl:otherwise>
                        </xsl:choose>  
                    </marc:datafield>
                    
                    <marc:datafield tag="336" ind1=" " ind2=" ">
                        <marc:subfield code="a">text</marc:subfield>
                        <marc:subfield code="b">txt</marc:subfield>
                        <marc:subfield code="2">rdacontent</marc:subfield>
                    </marc:datafield>
                    
                    <marc:datafield tag="337" ind1=" " ind2=" ">
                        <marc:subfield code="a">computer</marc:subfield>
                        <marc:subfield code="b">c</marc:subfield>
                        <marc:subfield code="2">rdamedia</marc:subfield>
                    </marc:datafield>
                    
                    <marc:datafield tag="338" ind1=" " ind2=" ">
                        <marc:subfield code="a">online resource</marc:subfield>
                        <marc:subfield code="b">cr</marc:subfield>
                        <marc:subfield code="2">rdacarrier</marc:subfield>
                    </marc:datafield>
                    
                    <marc:datafield tag="347" ind1=" " ind2=" ">
                        <marc:subfield code="a">text file</marc:subfield>
                        <marc:subfield code="2">rdaft</marc:subfield>
                    </marc:datafield>
                    <marc:datafield tag="347" ind1=" " ind2=" ">
                        <marc:subfield code="b">PDF</marc:subfield>
                    </marc:datafield>

                    <marc:datafield tag="347" ind1=" " ind2=" ">
                        <marc:subfield code="c">               
                            
                    <xsl:for-each select="$lookupfilesize/RS/R">
                        <xsl:if test="C1=$doi"> 
                            <xsl:value-of select="concat(round(C10 * 1000) div 1000,' MB')"/>
                        </xsl:if>
                    </xsl:for-each> 
                        </marc:subfield>
                    </marc:datafield>
                    
                    
                    <!-- Each advisor is in their own 500 which seems to be how the old script worked but is incorrect -->
                    <xsl:variable name="advisor1given" select="ListRecords/record/metadata/record/data/contributors/contributor[1]/givenname"/>
                    <xsl:variable name="advisor1family" select="ListRecords/record/metadata/record/data/contributors/contributor[1]/familyname"/>
                    <xsl:variable name="advisor2given" select="ListRecords/record/metadata/record/data/contributors/contributor[2]/givenname"/>
                    <xsl:variable name="advisor2family" select="ListRecords/record/metadata/record/data/contributors/contributor[2]/familyname"/>
                    <xsl:variable name="advisor3given" select="ListRecords/record/metadata/record/data/contributors/contributor[3]/givenname"/>
                    <xsl:variable name="advisor3family" select="ListRecords/record/metadata/record/data/contributors/contributor[3]/familyname"/>
                        
                    <xsl:if test="ListRecords/record/metadata/record/data/contributors/contributor[1]/role='Advisor'">
                        <marc:datafield tag="500" ind1=" " ind2=" ">
                            <marc:subfield code="a">
                                <xsl:value-of
                                    select="normalize-space(concat('Thesis supervisor: ',$advisor1given,' ',$advisor1family,'.'))" />
                            </marc:subfield>
                        </marc:datafield>
                    </xsl:if>
                    
                    <xsl:if test="ListRecords/record/metadata/record/data/contributors/contributor[2]/role='Advisor'">
                        <marc:datafield tag="500" ind1=" " ind2=" ">
                            <marc:subfield code="a">
                                <xsl:value-of
                                    select="normalize-space(concat('Thesis supervisor: ',$advisor2given,' ',$advisor2family,'.'))" />
                            </marc:subfield>
                        </marc:datafield>
                    </xsl:if>
                    
                    <xsl:if test="ListRecords/record/metadata/record/data/contributors/contributor[3]/role='Advisor'">
                        <marc:datafield tag="500" ind1=" " ind2=" ">
                            <marc:subfield code="a">
                                <xsl:value-of
                                    select="normalize-space(concat('Thesis supervisor: ',$advisor3given,' ',$advisor3family,'.'))" />
                            </marc:subfield>
                        </marc:datafield>
                    </xsl:if>
                        
                    <marc:datafield tag="502" ind1=" " ind2=" ">
                        <marc:subfield code="b">
                            <xsl:variable name="degreeabbrev" select="ListRecords/record/metadata/record/data/etd/degree.name"/>
                            <xsl:choose>
                                <xsl:when test="$degreeabbrev='Master of Arts (MA)'">
                                    <xsl:value-of>M.A.</xsl:value-of>
                                </xsl:when>
                                <xsl:when test="$degreeabbrev='Master of Fine Arts (MFA)'">
                                    <xsl:value-of>M.F.A.</xsl:value-of>
                                </xsl:when>
                                <xsl:when test="$degreeabbrev='Master of Science (MS)'">
                                    <xsl:value-of>M.S.</xsl:value-of>
                                </xsl:when>
                                <xsl:when test="$degreeabbrev='Master of Science in Nursing (MSN)'">
                                    <xsl:value-of>M.S.N.</xsl:value-of>
                                </xsl:when>
                                <xsl:when test="$degreeabbrev='Master of Social Work (MSW)'">
                                    <xsl:value-of>M.S.W.</xsl:value-of>
                                </xsl:when>
                                <xsl:when test="$degreeabbrev='Doctor of Musical Arts (DMA)'">
                                    <xsl:value-of>D.M.A.</xsl:value-of>
                                </xsl:when>
                                <xsl:when test="$degreeabbrev='Doctor of Philosophy (PhD)'">
                                    <xsl:value-of>Ph.D.</xsl:value-of>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$degreeabbrev"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </marc:subfield>
                        <marc:subfield code="c">
                            <xsl:value-of select="normalize-space(ListRecords/record/metadata/record/data/etd/degree.grantor)"/>
                        </marc:subfield>
                        <marc:subfield code="d">
                            <xsl:value-of select="concat(substring($date, 1, 4), '.')"/>
                        </marc:subfield>
                    </marc:datafield>
                                           
                    <xsl:if test="$bibliographic!=''">
                        <marc:datafield tag="504" ind1=" " ind2=" ">
                            <marc:subfield code="a">
                                <xsl:value-of
                                    select="normalize-space($bibliographic)"
                                />
                            </marc:subfield>
                        </marc:datafield>
                    </xsl:if> 
                    
                    <!--I don't think each paragraph shold be in its own 520 but this is what I have figured out - also, only the first 6 parapgraphs are included which seems to cover most etds--> 
                    <xsl:if test="ListRecords/record/metadata/record/data/description.abstract[1]!=''">
                        <marc:datafield tag="520" ind1="3" ind2=" ">
                            <marc:subfield code="a">
                                <xsl:value-of select="normalize-space(ListRecords/record/metadata/record/data/description.abstract[1])"/>
                            </marc:subfield>
                        </marc:datafield>
                    </xsl:if>
                    <xsl:if test="ListRecords/record/metadata/record/data/description.abstract[2]!=''">
                        <marc:datafield tag="520" ind1="8" ind2=" ">
                            <marc:subfield code="a">
                                <xsl:value-of select="normalize-space(ListRecords/record/metadata/record/data/description.abstract[2])"/>
                            </marc:subfield>
                        </marc:datafield>
                    </xsl:if>
                    <xsl:if test="ListRecords/record/metadata/record/data/description.abstract[3]!=''">
                        <marc:datafield tag="520" ind1="8" ind2=" ">
                            <marc:subfield code="a">
                                <xsl:value-of select="normalize-space(ListRecords/record/metadata/record/data/description.abstract[3])"/>
                            </marc:subfield>
                        </marc:datafield>
                    </xsl:if>
                    <xsl:if test="ListRecords/record/metadata/record/data/description.abstract[4]!=''">
                        <marc:datafield tag="520" ind1="8" ind2=" ">
                            <marc:subfield code="a">
                                <xsl:value-of select="normalize-space(ListRecords/record/metadata/record/data/description.abstract[4])"/>
                            </marc:subfield>
                        </marc:datafield>
                    </xsl:if>
                    <xsl:if test="ListRecords/record/metadata/record/data/description.abstract[5]!=''">
                        <marc:datafield tag="520" ind1="8" ind2=" ">
                            <marc:subfield code="a">
                                <xsl:value-of select="normalize-space(ListRecords/record/metadata/record/data/description.abstract[5])"/>
                            </marc:subfield>
                        </marc:datafield>
                    </xsl:if>
                    <xsl:if test="ListRecords/record/metadata/record/data/description.abstract[6]!=''">
                        <marc:datafield tag="520" ind1="8" ind2=" ">
                            <marc:subfield code="a">
                                <xsl:value-of select="normalize-space(ListRecords/record/metadata/record/data/description.abstract[5])"/>
                            </marc:subfield>
                        </marc:datafield>
                    </xsl:if>
                                
                    <marc:datafield tag="538" ind1=" " ind2=" ">
                        <marc:subfield code="a">System requirements: Adobe Reader.</marc:subfield>
                    </marc:datafield>

                    <xsl:variable name="copyright" select="ListRecords/record/metadata/record/data/copyright"/>
                    <marc:datafield tag="542" ind1=" " ind2=" ">
                        <marc:subfield code="f">
                            <xsl:value-of select="(normalize-space($copyright))"/>
                        </marc:subfield>
                    </marc:datafield>

                    <!--Not the right position for another note, but there probably won't be one and this at least keeps the note-->
                    <xsl:if test="ListRecords/record/metadata/record/data/comment!=''">
                    <xsl:choose>
                    <xsl:when test="contains(ListRecords/record/metadata/record/data/comment,'optimized')">
                        <marc:datafield tag="544" ind1=" " ind2=" ">
                            <marc:subfield code="a">University of Iowa Libraries, University Archives</marc:subfield>
                            <marc:subfield code="n">This thesis has been optimized for improved web viewing. If you require the original version, contact the University Archives at the University of Iowa: http://www.lib.uiowa.edu/sc/contact/</marc:subfield>
                        </marc:datafield>
                    </xsl:when>
                        <xsl:otherwise>
                            <marc:datafield tag="500" ind1=" " ind2=" ">
                                <marc:subfield code="a">
                                    <xsl:value-of select="normalize-space(ListRecords/record/metadata/record/data/comment)"/>
                                </marc:subfield>
                            </marc:datafield>
                        </xsl:otherwise>
                    </xsl:choose>
                    </xsl:if>

                    <xsl:variable name="keywordtest" select="ListRecords/record/metadata/record/data/keywords"/>
                    <xsl:if test="$keywordtest!=''">
                        <marc:datafield tag="653" ind1=" " ind2=" ">
                            <xsl:for-each select="ListRecords/record/metadata/record/data/keywords">
                                <xsl:variable name="keyword" select="."/>
                                <marc:subfield code="a">
                                    <xsl:value-of select="(functx:capitalize-first($keyword))"/>
                                </marc:subfield>
                            </xsl:for-each>
                        </marc:datafield>
                    </xsl:if>
                    
                    <marc:datafield tag="655" ind1=" " ind2="7">
                        <marc:subfield code="a">Academic theses.</marc:subfield>
                        <marc:subfield code="2">lcgft</marc:subfield>
                    </marc:datafield>
                    
                    <xsl:if test="ListRecords/record/metadata/record/data/contributors/contributor[1]/role='Advisor'">
                        <marc:datafield tag="700" ind1="1" ind2=" ">                       
                            <marc:subfield code="a">
                                <xsl:value-of
                                    select="normalize-space(concat($advisor1family,', ',$advisor1given,','))" />
                            </marc:subfield>
                            <marc:subfield code="e">
                                <xsl:value-of select="'thesis advisor.'"/>
                            </marc:subfield>
                            <xsl:if test="ListRecords/record/metadata/record/data/contributors/contributor[1]/identifierLcnaf!=''">
                                <marc:subfield code="0">
                                    <xsl:value-of
                                        select="ListRecords/record/metadata/record/data/contributors/contributor[1]/identifierLcnaf"
                                    />
                                </marc:subfield>
                            </xsl:if>
                        </marc:datafield>
                    </xsl:if>
                        
                        
                    <xsl:if test="ListRecords/record/metadata/record/data/contributors/contributor[2]/role='Advisor'">
                        <marc:datafield tag="700" ind1="1" ind2=" ">                       
                            <marc:subfield code="a">
                                <xsl:value-of
                                    select="normalize-space(concat($advisor2family,', ',$advisor2given,','))" />
                            </marc:subfield>
                            <marc:subfield code="e">
                                <xsl:value-of select="'thesis advisor.'"/>
                            </marc:subfield>
                            <xsl:if test="ListRecords/record/metadata/record/data/contributors/contributor[2]/identifierLcnaf!=''">
                                <marc:subfield code="0">
                                    <xsl:value-of
                                        select="ListRecords/record/metadata/record/data/contributors/contributor[2]/identifierLcnaf"
                                    />
                                </marc:subfield>
                            </xsl:if>
                        </marc:datafield>
                    </xsl:if>

                    <xsl:if test="ListRecords/record/metadata/record/data/contributors/contributor[3]/role='Advisor'">
                        <marc:datafield tag="700" ind1="1" ind2=" ">                       
                            <marc:subfield code="a">
                                <xsl:value-of
                                    select="normalize-space(concat($advisor3family,', ',$advisor3given,','))" />
                            </marc:subfield>
                            <marc:subfield code="e">
                                <xsl:value-of select="'thesis advisor.'"/>
                            </marc:subfield>
                            <xsl:if test="ListRecords/record/metadata/record/data/contributors/contributor[3]/identifierLcnaf!=''">
                                <marc:subfield code="0">
                                    <xsl:value-of
                                        select="ListRecords/record/metadata/record/data/contributors/contributor[3]/identifierLcnaf"
                                    />
                                </marc:subfield>
                            </xsl:if>
                        </marc:datafield>
                    </xsl:if>
                    
                    <marc:datafield tag="710" ind1="2" ind2=" ">
                        <marc:subfield code="a">University of Iowa.</marc:subfield>
                        <marc:subfield code="b">
                            <xsl:variable name="original_source_term" select="ListRecords/record/metadata/record/units/unit/unitLevel[1]/code"/>  
                            <xsl:for-each select="$lookupDoc/root/row">
                                <xsl:if test="code=$original_source_term"> 
                                    <xsl:value-of select="corpauthor"/>
                                </xsl:if>
                            </xsl:for-each>
                        </marc:subfield>
                    </marc:datafield>
                    
                    <marc:datafield tag="856" ind1="4" ind2="0">
                        <marc:subfield code="u">
                            <xsl:value-of select="normalize-space(concat('https://doi.org/',$doi))"/>
                        </marc:subfield>
                        
                        <xsl:if test="ListRecords/record/metadata/record/data/rightsList/rights/rights='Fixed Embargo Date'">
                            
                            <xsl:variable name="yyyy" select="substring(ListRecords/record/metadata/record/data/date.available,1,4)"/>
                            <xsl:variable name="mm" select="substring(ListRecords/record/metadata/record/data/date.available,5,2)"/>
                            <xsl:variable name="dd" select="substring(ListRecords/record/metadata/record/data/date.available,7,2)"/>                      
                            <xsl:variable name="mon">
                                <xsl:choose>
                                    <xsl:when test="$mm='01'">
                                        <xsl:value-of select="'January'" />
                                    </xsl:when>
                                    <xsl:when test="$mm='02'">
                                        <xsl:value-of select="'February'" />
                                    </xsl:when>
                                    <xsl:when test="$mm='03'">
                                        <xsl:value-of select="'March'" />
                                    </xsl:when>
                                    <xsl:when test="$mm='04'">
                                        <xsl:value-of select="'April'" />
                                    </xsl:when>
                                    <xsl:when test="$mm='05'">
                                        <xsl:value-of select="'May'" />
                                    </xsl:when>
                                    <xsl:when test="$mm='06'">
                                        <xsl:value-of select="'June'" />
                                    </xsl:when>
                                    <xsl:when test="$mm='07'">
                                        <xsl:value-of select="'July'" />
                                    </xsl:when>
                                    <xsl:when test="$mm='08'">
                                        <xsl:value-of select="'August'" />
                                    </xsl:when>
                                    <xsl:when test="$mm='09'">
                                        <xsl:value-of select="'September'" />
                                    </xsl:when>
                                    <xsl:when test="$mm='10'">
                                        <xsl:value-of select="'October'" />
                                    </xsl:when>
                                    <xsl:when test="$mm='11'">
                                        <xsl:value-of select="'November'" />
                                    </xsl:when>
                                    <xsl:when test="$mm='12'">
                                        <xsl:value-of select="'December'" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="'error'"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                                                 
                            <marc:subfield code="z">
                                <xsl:value-of select="concat('This thesis has been embargoed from public view until ',$mon,' ',$dd,', ',$yyyy,'.')"/>
                            </marc:subfield>
                            
                        </xsl:if>
                    </marc:datafield>
                    
                        <xsl:if test="ListRecords/record/metadata/record/data/links!=''">
                            <xsl:for-each select="ListRecords/record/metadata/record/data/links/link">
                                <marc:datafield tag="856" ind1="4" ind2="2">
                                    <marc:subfield code="3">
                                        <xsl:value-of select="normalize-space(link.description)"/>
                                    </marc:subfield>
                                    <marc:subfield code="u">
                                        <xsl:value-of select="link.url"/>
                                    </marc:subfield>
                                </marc:datafield>
                            </xsl:for-each>
                        </xsl:if>
                </marc:record>
                </xsl:if>
            </xsl:for-each>
        </marc:collection>
    </xsl:template>
</xsl:stylesheet>
