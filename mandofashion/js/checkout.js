
					var toggleShowOrderSummary = false;
					$(document).ready(function() {
						var currentUrl = '';
						const findPaymentMethodId = $('body').find('input:radio[name$="payment_method_id"]:checked').attr('type-id');
						const isReePay=findPaymentMethodId == 41 || findPaymentMethodId == 43 || findPaymentMethodId == 46 || findPaymentMethodId == 12;

						
							if(isReePay){
								
											funcFormOnSubmit('#section-payment-method')
									
							}
						
							currentUrl = '/checkouts/df21922a92ff4bfca35882ee9dffeac7?step=1';
						

						if ($('#reloadValue').val().length == 0)
						{
							$('#reloadValue').val(currentUrl);
							$('body').show();
						}
						else
						{
							window.location = $('#reloadValue').val();
							$('#reloadValue').val('');
						}

						$('body')
							.on('click', '.order-summary-toggle', function() {
								toggleShowOrderSummary = !toggleShowOrderSummary;

								if(toggleShowOrderSummary) {
									$('.order-summary-toggle')
										.removeClass('order-summary-toggle-hide')
										.addClass('order-summary-toggle-show');

									$('.sidebar:not(".sidebar-second") .sidebar-content .order-summary')
										.removeClass('order-summary-is-collapsed')
										.addClass('order-summary-is-expanded');
											
									$('.sidebar.sidebar-second .sidebar-content .order-summary')
										.removeClass('order-summary-is-expanded')
										.addClass('order-summary-is-collapsed');
								} else {
									$('.order-summary-toggle')
										.removeClass('order-summary-toggle-show')
										.addClass('order-summary-toggle-hide');

									$('.sidebar:not(".sidebar-second") .sidebar-content .order-summary')
										.removeClass('order-summary-is-expanded')
										.addClass('order-summary-is-collapsed');
											
									$('.sidebar.sidebar-second .sidebar-content .order-summary')
										.removeClass('order-summary-is-collapsed')
										.addClass('order-summary-is-expanded');
								}
							});
					});