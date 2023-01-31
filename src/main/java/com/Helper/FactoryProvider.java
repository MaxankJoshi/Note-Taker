package com.Helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	private static SessionFactory factory;
	
	public static SessionFactory getFactory() {
		
		if(factory==null) {
			Configuration cfg = new Configuration();
			cfg.configure("hibernateConfig.xml");
			factory = cfg.buildSessionFactory();
		}
		
		return factory;
	}
	
	public static void closeFactory() {
		
		if(factory.isOpen()) {
			factory.close();
		}
	}

}