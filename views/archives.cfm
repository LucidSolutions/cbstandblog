<cfoutput>	
<div id="body-header">
	<div class="container">
		<!--- Title --->
		<div class="underlined-title">
			<h1>Blog</h1>
		</div>
	</div>
</div>

<!-- Banner Starts Here -->
<div class="heading-page header-text" id="body-header">
	<section class="page-heading overlay-dark">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="text-content">
						<h4>Post Details</h4>
	                    <h2>Single blog post</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<!-- Banner Ends Here -->

<!--- Body Main --->
<section class="main-banner blog-posts grid-system" id="body-main">
	<div class="container">	
		<div class="row">
			<!--- Content --->
			<div class="col-lg-8">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<!--- ContentBoxEvent --->
						#cb.event( "cbui_preArchivesDisplay" )#

						<!--- Title --->
						<h2 class="mb-3">Blog Archives - #prc.entriesCount# Record(s)</h2>

						<!--- Archives --->
						<cfif rc.year NEQ 0>
							<div class="alert alert-info main-button">
								Year: '#rc.year#'
								<cfif rc.month NEQ 0>- Month: '#rc.month#'</cfif>
								<cfif rc.day NEQ 0>- Day: '#rc.day#'</cfif>
							</div>
							<p class="mb-3"><a class="themeBtn" href="#cb.linkBlog()#" title="Remove filter and view all entries">Remove Filter</a></p>
						</cfif>
					</div>
					<!---
						Display Entries using ContentBox collection template rendering
						The default convention for the template is "entry.cfm" you can change it via the quickEntries() 'template' argument.
						I could have done it manually, but why?
					 --->
					#cb.quickEntries()#

					<!--- Paging via ContentBox via quick HTML, again I could have done it manually, but why? --->
					<!--- Pagination --->
					<cfif prc.entriesCount>
						<div class="col-lg-12 col-md-12 contentBar">
							#cb.quickPaging()#
						</div>
					</cfif>

					<!--- ContentBoxEvent --->
					#cb.event( "cbui_postArchivesDisplay" )#
				</div>
			</div>

			<!--- SideBar: That's right, I can render any layout views by using quickView() or coldbox render methods --->
			<cfif args.sidebar>
			<div class="col-lg-4" id="blog-sidenav">
				<div class="sidebar">
					<div class="row">
						#cb.quickView( view='_blogsidebar', args=args )#
					</div>
				</div>
			</div>
			</cfif>
		</div>
	</div>
</section>		
</cfoutput>
