/**
 *
 */
package de.hybris.sdh.core.dao.impl;

import de.hybris.platform.servicelayer.internal.dao.DefaultGenericDao;
import de.hybris.platform.servicelayer.search.FlexibleSearchQuery;
import de.hybris.platform.servicelayer.search.FlexibleSearchService;
import de.hybris.platform.servicelayer.search.SearchResult;
import de.hybris.sdh.core.dao.PseBankListCatalogDao;
import de.hybris.sdh.core.model.PseBankListCatalogModel;

import javax.annotation.Resource;


/**
 * @author edson.roa
 *
 */
public class DefaultPseBankListCatalogDao extends DefaultGenericDao<PseBankListCatalogModel> implements PseBankListCatalogDao
{

	@Resource(name = "flexibleSearchService")
	private FlexibleSearchService defaultFlexibleSearchService;

	private static final String GET_ALL_BANK_ENTRY_QUERY = "Select {p:" + PseBankListCatalogModel.PK + "} from {"
			+ PseBankListCatalogModel._TYPECODE + " AS p} ";

	private static final String GET_BANK_ENTRY_BY_CODE = "Select {p:" + PseBankListCatalogModel.PK + "} from {"
			+ PseBankListCatalogModel._TYPECODE + " AS p} WHERE {" + PseBankListCatalogModel.FINANCIALINSTITUTIONCODE + "} = ?"+PseBankListCatalogModel.FINANCIALINSTITUTIONCODE+"" ;


	public DefaultPseBankListCatalogDao(final String typecode)
	{
		super(typecode);
	}

	@Override
	public SearchResult<PseBankListCatalogModel> getAllBankEntries()
	{
		final FlexibleSearchQuery query = new FlexibleSearchQuery(GET_ALL_BANK_ENTRY_QUERY);
		return getFlexibleSearchService().search(query);
	}

	@Override
	public PseBankListCatalogModel getBankByFinancialInstitutionCode(final String financialInstitutionCode)
	{
		final FlexibleSearchQuery query = new FlexibleSearchQuery(GET_BANK_ENTRY_BY_CODE);
		query.addQueryParameter(PseBankListCatalogModel.FINANCIALINSTITUTIONCODE,financialInstitutionCode);
		return getFlexibleSearchService().searchUnique(query);
	}

}