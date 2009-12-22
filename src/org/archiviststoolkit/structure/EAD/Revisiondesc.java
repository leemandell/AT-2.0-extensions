//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.1.2-b01-fcs 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2007.04.11 at 01:13:59 PM EDT 
//


package org.archiviststoolkit.structure.EAD;

import java.util.ArrayList;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlID;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.adapters.CollapsedStringAdapter;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;


/**
 * <p>Java class for revisiondesc complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="revisiondesc">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;choice>
 *         &lt;element name="list" type="{urn:isbn:1-931666-22-9}list"/>
 *         &lt;element name="change" type="{urn:isbn:1-931666-22-9}change" maxOccurs="unbounded"/>
 *       &lt;/choice>
 *       &lt;attGroup ref="{urn:isbn:1-931666-22-9}a.common"/>
 *       &lt;attribute name="encodinganalog" type="{http://www.w3.org/2001/XMLSchema}anySimpleType" />
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "revisiondesc", namespace = "urn:isbn:1-931666-22-9", propOrder = {
    "list",
    "change"
})
public class Revisiondesc {

    @XmlElement(namespace = "urn:isbn:1-931666-22-9")
    protected org.archiviststoolkit.structure.EAD.List list;
    @XmlElement(namespace = "urn:isbn:1-931666-22-9")
    protected java.util.List<Change> change;
    @XmlAttribute
    @XmlSchemaType(name = "anySimpleType")
    protected String encodinganalog;
    @XmlAttribute
    @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
    @XmlID
    @XmlSchemaType(name = "ID")
    protected String id;
    @XmlAttribute
    @XmlSchemaType(name = "anySimpleType")
    protected String altrender;
    @XmlAttribute
    @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
    protected String audience;

    /**
     * Gets the value of the list property.
     * 
     * @return
     *     possible object is
     *     {@link org.archiviststoolkit.structure.EAD.List }
     *     
     */
    public org.archiviststoolkit.structure.EAD.List getList() {
        return list;
    }

    /**
     * Sets the value of the list property.
     * 
     * @param value
     *     allowed object is
     *     {@link org.archiviststoolkit.structure.EAD.List }
     *     
     */
    public void setList(org.archiviststoolkit.structure.EAD.List value) {
        this.list = value;
    }

    /**
     * Gets the value of the change property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the change property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getChange().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link Change }
     * 
     * 
     */
    public java.util.List<Change> getChange() {
        if (change == null) {
            change = new ArrayList<Change>();
        }
        return this.change;
    }

    /**
     * Gets the value of the encodinganalog property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getEncodinganalog() {
        return encodinganalog;
    }

    /**
     * Sets the value of the encodinganalog property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setEncodinganalog(String value) {
        this.encodinganalog = value;
    }

    /**
     * Gets the value of the id property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getId() {
        return id;
    }

    /**
     * Sets the value of the id property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setId(String value) {
        this.id = value;
    }

    /**
     * Gets the value of the altrender property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAltrender() {
        return altrender;
    }

    /**
     * Sets the value of the altrender property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAltrender(String value) {
        this.altrender = value;
    }

    /**
     * Gets the value of the audience property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAudience() {
        return audience;
    }

    /**
     * Sets the value of the audience property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAudience(String value) {
        this.audience = value;
    }

}