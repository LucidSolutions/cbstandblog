<cfoutput>
<!--- ContentBoxEvent --->
#cb.event( "cbui_BeforeSideBar" )#

<cfif cb.themeSetting( "showEntriesSearchBlogSide", true )>
	<div class="col-md-12">
		<div class="sidebar-item search">
			#cb.widget( "BlogSearchForm" )#
		</div>
	</div>
</cfif>

<cfif cb.themeSetting( "showRecentEntriesBlogSide", true )>
	<div class="col-md-12">
		<div class="sidebar-item recent-posts">
            <div class="sidebar-heading"><h2>Recent Posts</h2></div>
            <div class="content">#cb.widget( 'RecentPosts' )#</div>
		</div>
	</div>
</cfif>

<cfif cb.themeSetting( "showCategoriesBlogSide", true )>
	<div class="col-md-12">
		<div class="sidebar-item categories">
			<div class="sidebar-heading"><h2>Categories</h2></div>
			<div class="content">
				<!---Display Categories using ContentBox collection template rendering the default convention for the template is "category.cfm" you can change it via the quickCategories() 'template' argument.--->
				<ul>#cb.quickCategories()#</ul>
			</div>
		</div>
	</div>
</cfif>

<cfif cb.themeSetting( "showSiteUpdatesBlogSide", true )>
	<!--- RSS Buttons --->
	<div class="col-md-12">
		<div class="sidebar-item site-updates">
			<div class="sidebar-heading"><h2>Site Updates</h2></div>
			<div class="content">
				<ul>
					<li><a href='#cb.linkRSS()#' title="Subscribe to our RSS Feed!"><i class="fa fa-rss"></i> RSS Feed</a></li>
				</ul>
			</div>
		</div>
	</div>
</cfif>

<cfif cb.isEntryView()>
	<cfif cb.themeSetting( "showEntryCommentsBlogSide", true )>
	<!--- RSS Entry Comments --->
	<div class="col-md-12">
		<div class="sidebar-item comments">
			<div class="sidebar-heading"><h2>Entry Comments</h2></div>
			<div class="content">
				<ul>
					<li><a href="#cb.linkRSS(comments=true,entry=prc.entry)#" title="Subscribe to our Entry's Comment(s) RSS Feed!"><i class="fa fa-rss"></i> RSS Feed</a></li>
				</ul>
			</div>
		</div>
	</div>
	</cfif>
</cfif>

<cfif cb.themeSetting( "showArchivesBlogSide", true )>
	<div class="col-md-12">
		<div class="sidebar-item archives">
			<div class="sidebar-heading"><h2>Archives</h2></div>
			<div class="content">
				#cb.widget( "Archives" )#
			</div>
		</div>
	</div>
</cfif>
<!---#cb.widget("Meta",{titleLevel="4"})#--->

<!--- ContentBoxEvent --->
#cb.event( "cbui_afterSideBar" )#
</cfoutput>