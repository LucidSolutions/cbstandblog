<cfoutput>

<cfif len( cb.themeSetting( 'blogLayout' ) )>
	<cfif cb.themeSetting( 'blogLayout' ) eq 'Two Column'>
		<div class="col-md-12 col-lg-6">
	<cfelse>
		<div class="col-md-12 col-lg-12">
	</cfif>
		<div class="blog-post" id="post_#entry.getContentID()#">
			<!--- Blog Post Image --->
			<cfif entry.getFeaturedImageURL() NEQ "">
				<div class="blog-thumb"><a href="#cb.linkEntry(entry)#"><img class="img-fluid" src="#entry.getFeaturedImageURL()#" alt="#entry.getTitle()#"></a></div>
			<cfelse>
				<div class="blog-thumb"><a href="#cb.linkEntry(entry)#"></a></div>
			</cfif>


			<!--- Blog Post Detail --->
			<div class="down-content">
				<span>#cb.quickCategoryLinks(entry)#</span>
				<!--- Blog Post Title --->
				<a href="#cb.linkEntry(entry)#"><h4>#entry.getTitle()#</h4></a>
			
				<ul class="post-info">
					<li><a href="#cb.linkEntry(entry)#">#entry.getAuthorName()#</a></li>
					<li><a href="#cb.linkEntry(entry)#">#entry.getDisplayPublishedDate()#</a></li>
					<li><a href="#cb.linkEntry(entry)#">#entry.getNumberOfApprovedComments()# Comments</a></li>
				</ul>
				<div class="para">#left(ReReplaceNoCase(entry.renderContent(),"<[^>]*>","","ALL"),200)#...</div>

				<div class="post-options">
					<div class="row">
						<div class="col-md-12">
							<ul class="post-tags">
								<li><i class="fa fa-tags"></i></li>
								<li>#cb.quickCategoryLinks(entry)#</li>
							</ul>
						</div>
					</div>
				</div>
		    </div>
		</div>
	</div>
</cfif>
</cfoutput>