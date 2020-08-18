<cfset  myObject = cb.getSearchResults()>

<cfoutput>
	<!--- ContentBoxEvent --->
	#cb.event( "cbui_prePageDisplay" )#

	<!-- Banner Starts Here -->
	<div class="heading-page header-text" id="body-header">
		<section class="page-heading overlay-dark">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="text-content">
							<h4>Search Results for: <span>#cb.getSearchTerm()#</span></h4>
		                    <h2>#myObject.getTotal()# Record(s)</h2>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- Banner Ends Here -->

	<!--- Body Main --->
	<section class="main-banner blog-posts grid-system search-section" id="body-main">
		<div class="container">
			<!--- Search Results --->
			#cb.getSearchResultsContent()#

			<!--- Search paging --->
			#cb.quickSearchPaging()#
		</div>
	</section>

	<!--- ContentBoxEvent --->
	#cb.event( "cbui_postPageDisplay" )#
</cfoutput>