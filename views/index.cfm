<cfoutput>

<!-- Banner Starts Here -->
<div class="heading-page header-text" id="body-header">
  <section class="page-heading overlay-dark">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="text-content">
            <h4>Recent Posts</h4>
            <h2>Our Recent Blog Entries</h2>
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
					<!--- ContentBoxEvent --->
					#cb.event( "cbui_preIndexDisplay" )#
						
					<!--- Are we filtering by category? --->
					<cfif len( rc.category )>
						<div class="col-lg-12 col-md-12">
							<h2 class="mb-3">Category Filtering: '#rc.category#'</h2>
							<p class="mb-3"><a href="#cb.linkBlog()#" class="themeBtn" title="Remove filter and view all entries">Remove Filter</a></p>
						</div>
					</cfif>
			
					<!--- Are we searching --->
					<cfif len( rc.q )>
						<div class="col-lg-12 col-md-12">
							<p><a class="themeBtn" href="#cb.linkBlog()#" title="Clear search and view all entries">Clear Search</a></p>
							<p>Searching by: '#rc.q#'</p>
							<br/>
						</div>
					</cfif>
			
					<!--- Entries displayed here --->
					#cb.quickEntries()#
			
					<!--- Pagination --->
					<cfif prc.entriesCount>
						<div class="col-lg-12 col-md-12 contentBar">
							#cb.quickPaging()#
						</div>
					</cfif>
			
					<!--- ContentBoxEvent --->
					#cb.event( "cbui_postIndexDisplay" )#
				</div>
			</div>
		
			<!--- SideBar --->
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