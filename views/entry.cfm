<cfoutput>
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
			<div class="<cfif args.sidebar>col-lg-8<cfelse>col-lg-12</cfif>">
				<!--- ContentBoxEvent --->
				#cb.event("cbui_preEntryDisplay")#
				
				<div class="all-blog-posts">
					<div class="row">
						<div class="col-lg-12">
							<!--- post --->
							<div class="blog-post" id="post_#prc.entry.getContentID()#">
								
								<!--- Blog Post Image --->
								<cfif prc.entry.getFeaturedImageURL() NEQ "">
									<div class="blog-thumb"><img class="img-fluid" src="#prc.entry.getFeaturedImageURL()#" alt="#prc.entry.getTitle()#"></div>
								</cfif>

								<!--- Blog Post Detail --->
								<div class="down-content">
									<span>#cb.quickCategoryLinks(prc.entry)#</span>
									<!--- Blog Post Title --->
									<h4>#prc.entry.getTitle()#</h4>
								
									<ul class="post-info">
										<li><a href="javascript:void(0)">#prc.entry.getAuthorName()#</a></li>
										<li><a href="javascript:void(0)">#prc.entry.getDisplayPublishedDate()#</a></li>
										<li><a href="javascript:void(0)">#prc.entry.getNumberOfApprovedComments()# Comments</a></li>
									</ul>
									<div class="para">#prc.entry.renderContent()#</div>

									<div class="post-options">
										<div class="row">
											<div class="col-md-6">
												<ul class="post-tags">
													<li><i class="fa fa-tags"></i></li>
													<li>#cb.quickCategoryLinks(prc.entry)#</li>
												</ul>
											</div>
											<div class="col-md-6">
												<ul class="post-share">
													<li><i class="fa fa-share-alt"></i></li>
													<li><a href="http://www.facebook.com/share.php?u=#cb.linkEntry(prc.entry)#">Facebook</a>,</li>
													<li><a href="https://twitter.com/share?url=#cb.linkEntry(prc.entry)#&amp;text=#prc.entry.getTitle()#"> Twitter</a></li>
												</ul>
											</div>
										</div>
									</div>
					    		</div>
							</div>
						</div>

						<div class="col-lg-12">
							<cfif prc.entry.getNumberOfApprovedComments() GT 0>
								<!--- Display Comments --->
								<div id="comments">
									<div class="row">	
										<div class="col-md-12">						
											<div class="sidebar-item comments">
												<div class="sidebar-heading">
													<h2>#prc.entry.getNumberOfApprovedComments()# comments</h2>
												</div>
												<div class="content">	
													#cb.quickComments()#
												</div>
											</div>
										</div>				
									</div>
								</div>
							</cfif>
							<cfif !args.print>
								<cfif NOT cb.isCommentsEnabled(prc.entry)>
									<!--- Comments Bar --->
									#html.anchor(name="comments")#
									<div class="post-comments">
										<div class="infoBar">
												<i class="icon-warning-sign icon-2x"></i> Comments are currently closed
										</div>
									</div>
								</cfif>
								
								<!--- Comment Form: I can build it or I can quick it? --->
								<div id="commentFormShell">
									<div class="row">
										<div class="col-md-12">
											<div class="sidebar-item submit-comment">
												<div class="sidebar-heading">
													<h2>Your comment</h2>
												</div>
												<div class="content">	
													#cb.quickCommentForm( prc.entry )#
												</div>
											</div>
										</div>
									</div>
								</div>
							</cfif>
						</div>
					</div>
				</div>
		
				<!--- ContentBoxEvent --->
				#cb.event("cbui_postEntryDisplay")#
			</div>
		
			<cfif args.sidebar>
				<div class="col-lg-4" id="blog-sidenav">
					<div class="sidebar">
						<div class="row">
							#cb.quickView(view='_blogsidebar', args=args)#
						</div>
					</div>
				</div>
			</cfif>
		</div>
	</div>
</section>
</cfoutput>