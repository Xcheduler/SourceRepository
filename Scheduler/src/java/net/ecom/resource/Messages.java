/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package net.ecom.resource;

import java.util.MissingResourceException;
import java.util.ResourceBundle;
/**
 *
 * @author udhaya
 */
public class Messages {
private static final String BUNDLE_NAME = "net.ecom.resource.eComProperty"; //$NON-NLS-1$

	private static final ResourceBundle RESOURCE_BUNDLE = ResourceBundle
			.getBundle(BUNDLE_NAME);

	private Messages() {	}

	public static String getString(String key) {
		try {
			return RESOURCE_BUNDLE.getString(key);
		} catch (MissingResourceException e) {
			return '!' + key + '!';
		}
	}
}
