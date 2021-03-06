/**
 * Archivists' Toolkit(TM) Copyright � 2005-2007 Regents of the University of California, New York University, & Five Colleges, Inc.
 * All rights reserved.
 *
 * This software is free. You can redistribute it and / or modify it under the terms of the Educational Community License (ECL)
 * version 1.0 (http://www.opensource.org/licenses/ecl1.php)
 *
 * This software is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
 * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the ECL license for more details about permissions and limitations.
 *
 *
 * Archivists' Toolkit(TM)
 * http://www.archiviststoolkit.org
 * info@archiviststoolkit.org
 */

package org.archiviststoolkit.model;

import org.archiviststoolkit.mydomain.DomainObject;
import org.archiviststoolkit.mydomain.SequencedObject;
import org.archiviststoolkit.structure.IncludeInApplicationConfiguration;
import org.archiviststoolkit.structure.ExcludeFromDefaultValues;

import java.io.Serializable;
import java.beans.PropertyChangeListener;

import com.jgoodies.binding.beans.ExtendedPropertyChangeSupport;

@ExcludeFromDefaultValues
public class NameContactNotes  extends SimpleRepeatableNotes implements Serializable, Comparable {

	public static final String PROPERTYNAME_SORT_NAME    = "sortName";

	private Names name;

	/**
	 * Full constructor;
	 */
	public NameContactNotes(Names parentName) {
		super();
		this.name = parentName;
	}

	public NameContactNotes() {
	}

	public Names getName() {
		return name;
	}

	public void setName(Names name) {
		this.name = name;
	}

	public String getSortName() {
		if (name == null) {
			return "";
		} else {
			return name.getSortName();
		}
	}
}
