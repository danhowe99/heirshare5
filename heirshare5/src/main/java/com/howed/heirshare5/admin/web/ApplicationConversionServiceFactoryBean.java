package com.howed.heirshare5.admin.web;

import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;
import org.springframework.roo.addon.web.mvc.controller.converter.RooConversionService;

import com.howed.heirshare5.domain.EstateAdministrator;

/**
 * A central place to register application converters and formatters. 
 */
@RooConversionService
public class ApplicationConversionServiceFactoryBean extends FormattingConversionServiceFactoryBean {

	@Override
	@SuppressWarnings("deprecation")
	protected void installFormatters(FormatterRegistry registry) {
		super.installFormatters(registry);
		// Register application converters and formatters
	}

    public Converter<EstateAdministrator, String> getEstateAdministratorToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.howed.heirshare5.domain.EstateAdministrator, java.lang.String>() {
            public String convert(EstateAdministrator estateAdministrator) {
                return new StringBuilder().append(estateAdministrator.getEmail()).toString();
            }
        };
    }
}
