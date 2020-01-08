/**
 *
 */
package de.hybris.sdh.core.dao.impl;

import de.hybris.platform.servicelayer.internal.dao.DefaultGenericDao;
import de.hybris.platform.servicelayer.search.FlexibleSearchQuery;
import de.hybris.platform.servicelayer.search.FlexibleSearchService;
import de.hybris.platform.servicelayer.search.SearchResult;
import de.hybris.sdh.core.constants.ControllerPseConstants;
import de.hybris.sdh.core.dao.PseTransactionsLogDao;
import de.hybris.sdh.core.model.PseTransactionsLogModel;

import javax.annotation.Resource;


/**
 * @author edson.roa
 *
 */
public class DefaultPseTransactionsLogDao extends DefaultGenericDao<PseTransactionsLogModel> implements PseTransactionsLogDao
{


	public DefaultPseTransactionsLogDao(final String typecode)
	{
		super(typecode);
	}

	@Resource(name = "flexibleSearchService")
	private FlexibleSearchService defaultFlexibleSearchService;

	@Override
	public SearchResult<PseTransactionsLogModel> getAllOutstandingTransactions(final String transactionState)
	{

		String GET_ALL_OUTSTANDING_TRANSACTIONS = new String();

		if (transactionState.length() == 0)
		{
			GET_ALL_OUTSTANDING_TRANSACTIONS = "Select {p:" + PseTransactionsLogModel.PK + "} from {"
					+ PseTransactionsLogModel._TYPECODE + " AS p} Where " + "{p:" + PseTransactionsLogModel.TRANSACTIONSTATE
					+ "} is null";
		}
		else
		{
			GET_ALL_OUTSTANDING_TRANSACTIONS = "Select {p:" + PseTransactionsLogModel.PK + "} from {"
					+ PseTransactionsLogModel._TYPECODE + " AS p} Where " + "{p:" + PseTransactionsLogModel.TRANSACTIONSTATE + "} = '"
					+ transactionState + "' ";
		}


		final FlexibleSearchQuery query = new FlexibleSearchQuery(GET_ALL_OUTSTANDING_TRANSACTIONS);
		return getFlexibleSearchService().search(query);
	}

	@Override
	public PseTransactionsLogModel getTransaction(final String numeroDeReferencia)
	{
		PseTransactionsLogModel transactionModel = null;
		final String GET_TRANSACTION = "Select {p:" + PseTransactionsLogModel.PK + "} from {"
				+ PseTransactionsLogModel._TYPECODE + " AS p} Where {p:" + PseTransactionsLogModel.NUMERODEREFERENCIA + "} = '"
				+ numeroDeReferencia + "'";

		final FlexibleSearchQuery query = new FlexibleSearchQuery(GET_TRANSACTION);
		final SearchResult<PseTransactionsLogModel> transactions = getFlexibleSearchService().search(query);

		if (transactions.getResult().size() > 0)
		{
			transactionModel = transactions.getResult().get(0);
	   }

		return transactionModel;
	}

	/*
	 * (non-Javadoc) Just PSE/ACH Transactions
	 *
	 * @see de.hybris.sdh.core.dao.PseTransactionsLogDao#getAllTransactionsNotNotifiedPaymentAndStatusOk()
	 */
	@Override
	public SearchResult<PseTransactionsLogModel> getAllTransactionsNotNotifiedPaymentAndStatusOk(
			final String transactionStateStatus, final String notificacionRecaudoStatus)
	{
		final String GET_ALL_TRANSACTION_NOT_NOTIFIED_PAYMENT = "Select {p:" + PseTransactionsLogModel.PK + "} from {"
		      + PseTransactionsLogModel._TYPECODE + " AS p} Where "
				+ "{p:" + PseTransactionsLogModel.TRANSACTIONSTATE + "} = '" + transactionStateStatus + "' AND " + "{p:"
				+ PseTransactionsLogModel.NOTIFICACIONDERECAUDO + "} = '" + notificacionRecaudoStatus + "' AND " + "{p:"
				+ PseTransactionsLogModel.ENTITYCODE + "} NOT IN ('" + ControllerPseConstants.CREDIBANCO_IDENTIFIER_TRANSACTION
				+ "')";

		final FlexibleSearchQuery query = new FlexibleSearchQuery(GET_ALL_TRANSACTION_NOT_NOTIFIED_PAYMENT);
		final SearchResult<PseTransactionsLogModel> transactions = getFlexibleSearchService().search(query);
		return getFlexibleSearchService().search(query);
	}

	/*
	 * (non-Javadoc)
	 *
	 * @see
	 * de.hybris.sdh.core.dao.PseTransactionsLogDao#getAllCredibancoTransactionsNotNotifiedPaymentAndStatusAproved(java.
	 * lang.String, java.lang.String)
	 */
	@Override
	public SearchResult<PseTransactionsLogModel> getAllCredibancoTransactionsNotNotifiedPaymentAndStatusAproved(
			final String transactionStateStatus, final String notificacionRecaudoStatus)
	{
		final String GET_ALL_TRANSACTION_NOT_NOTIFIED_PAYMENT = "Select {p:" + PseTransactionsLogModel.PK + "} from {"
				+ PseTransactionsLogModel._TYPECODE + " AS p} Where " + "{p:" + PseTransactionsLogModel.CRERESPONSESTATUS + "} = '"
				+ transactionStateStatus + "' AND " + "{p:" + PseTransactionsLogModel.NOTIFICACIONDERECAUDO + "} = '"
				+ notificacionRecaudoStatus + "' AND " + "{p:" + PseTransactionsLogModel.ENTITYCODE + "} = '"
				+ ControllerPseConstants.CREDIBANCO_IDENTIFIER_TRANSACTION + "'";

		final FlexibleSearchQuery query = new FlexibleSearchQuery(GET_ALL_TRANSACTION_NOT_NOTIFIED_PAYMENT);
		final SearchResult<PseTransactionsLogModel> transactions = getFlexibleSearchService().search(query);
		return getFlexibleSearchService().search(query);
	}

}
