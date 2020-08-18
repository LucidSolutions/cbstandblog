<cfoutput>
<header class="">
	<nav class="navbar navbar-expand-lg">
		<div class="container">
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="##navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
			<cfif cb.themeSetting( 'headerLogo' ) is "">
				<a href="#cb.linkHome()#" class="navbar-brand" title="#cb.siteTagLine()#" data-toggle="tooltip"><h2>#cb.siteName()#<em>.</em></h2></a>
			<cfelse>
				<a href="#cb.linkHome()#" class="navbar-brand brand-img" title="#cb.siteTagLine()#" data-toggle="tooltip"><img src="#cb.themeSetting( 'headerLogo' )#" alt="#cb.siteName()#"></a>
			</cfif>

			<!--- Generate Menu --->
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<cfset menuData = cb.rootMenu( type="data", levels="2" )>
					<!--- Iterate and build pages --->
					<cfloop array="#menuData#" index="menuItem">
						<cfif structKeyExists( menuItem, "subPageMenu" )>
							<li class="nav-item dropdown">
								<a href="#menuItem.link#" class="nav-link dropdown-toggle" data-toggle="dropdown">#menuItem.title# <b class="caret"></b></a>
								#buildSubMenu( menuData=menuItem.subPageMenu, parentLink=menuItem.link, parentTitle=menuItem.title )#
							</li>
						<cfelse>
							<cfif cb.isPageView() AND event.buildLink( cb.getCurrentPage().getSlug() ) eq menuItem.link>
								<li class="nav-item active">
							<cfelseif cb.isHomePage() AND menuItem.title eq 'Home'>
								<li class="nav-item active">
							<cfelse>
								<li class="nav-item">
							</cfif>
								<a class="nav-link" href="#menuItem.link#">#menuItem.title#</a>
							</li>
						</cfif>
					</cfloop>

					<!--- Blog Link, verify active --->
					<cfif ( !prc.cbSettings.cb_site_disable_blog )>
						<cfif cb.isBlogView()><li class="nav-item active"><cfelse><li></cfif>
							<a class="nav-link" href="#cb.linkBlog()#">Blog</a>
						</li>
					</cfif>
				</ul>

				<!--- Blog Search Form ---
				<cfif ( !prc.cbSettings.cb_site_disable_blog )>
					<form id="searchForm" class="navbar-form navbar-right" name="searchForm" method="post" action="#cb.linkSearch()#">
						<input type="text" class="form-control col-lg-8" placeholder="Search">
					</form>
				</cfif>--->
			</div>
		</div>
	</nav>
</header>

<cfif cb.themeSetting( "showSiteSearch", true )>
<!--- Search Bar --->
<div id="body-search">
	<div class="container">
		<form id="searchForm" name="searchForm" method="post" action="#cb.linkContentSearch()#">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Enter search terms..." name="q" id="q" value="#cb.getSearchTerm()#">
				<span class="input-group-btn">
					<button type="submit" class="btn btn-default">Search</button>
				</span>
			</div>
		</form>
	</div>
</div>
</cfif>

<cfscript>
any function buildSubMenu( required menuData, required parentLink, required parentTitle ){
	var menu = '<ul class="dropdown-menu">';

	// Parent
	menu &= '<li class="nav-item"><a class="nav-link" href="#parentLink#"><strong>#parentTitle#</strong></a></li><li role="separator" class="divider"></li>';

	for( var menuItem in arguments.menuData ){
		if( !structKeyExists( menuItem, "subPageMenu" ) ){
			menu &= '<li class="nav-item"><a class="nav-link" href="#menuItem.link#">#menuItem.title#</a></li>';
		} else {
			menu &= '<li class="nav-item dropdown-submenu"><a href="#menuItem.link#" class="nav-link dropdown-toggle" data-toggle="dropdown">#menuItem.title#</a>';
			menu &= buildSubMenu( menuItem.subPageMenu, menuItem.link, menuItem.parentTitle );
			menu &= '</li>';
		}
	}
	menu &= '</ul>';

	return menu;
}
</cfscript>
</cfoutput>