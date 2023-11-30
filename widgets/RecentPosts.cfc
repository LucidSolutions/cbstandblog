/**
* ContentBox - A Modular Content Platform
* Copyright since 2012 by Ortus Solutions, Corp
* www.ortussolutions.com/products/contentbox
* ---
* A cool basic widget that shows N recent entries
*/
component extends="contentbox.models.ui.BaseWidget" singleton{

	RecentPosts function init(){
		// Widget Properties
		setName( "RecentPosts" );
		setVersion( "1.0" );
		setDescription( "A cool basic widget that shows N recent blog posts." );
		setAuthor( "Lucid Outsourcing Solutions" );
		setAuthorURL( "https://lucidoutsourcing.com/" );
		setIcon( "list" );
		setCategory( "Blog" );
		return this;
	}

	/**
	* Show n recent entries with some cool orderings
	* @max.hint The number of recent entries to show. By default it shows 5
	* @title.hint An optional title to display using an H2 tag.
	* @titleLevel.hint The H{level} to use, by default we use H2
	* @category.hint The list of categories to filter on
	* @category.multiOptionsUDF getAllCategories
	* @searchTerm.hint The search term to filter on
	* @searchTerm.label Search Term
	* @sortOrder.hint How to order the results, defaults to publishedDate
	* @sortOrder.label Sort Order
	* @sortOrder.options Most Recent,Most Popular,Most Commented
	*/
	any function renderIt(
		numeric max=5,
		title="",
		string titleLevel="2",
		string category="",
		string searchTerm="",
		string sortOrder="Most Recent"
	){
		var event 			= getRequestContext();
		var cbSettings 		= event.getValue( name="cbSettings", private=true );
		
		// Determine Sort Order
		// Determine Sort Order
		switch ( arguments.sortOrder ) {
			case "Most Popular": {
				arguments.sortOrder = "hits DESC";
				break;
			}
			case "Most Commented": {
				arguments.sortOrder = "numberOfComments DESC";
				break;
			}
			default: {
				arguments.sortOrder = "publishedDate DESC";
			}
		}

		var entryResults = variables.entryService.findPublishedContent(
			max       : arguments.max,
			category  : arguments.category,
			searchTerm: arguments.searchTerm,
			sortOrder : arguments.sortOrder,
			siteID    : getSite().getsiteID()
		);

		var rString			= "";

		// iteration cap
		if( entryResults.count lt arguments.max){
			arguments.max = entryResults.count;
		}

		// generate recent comments
		saveContent variable="rString"{
			// title
			if( len(arguments.title) ){ writeOutput( "<h#arguments.titleLevel#>#arguments.title#</h#arguments.titleLevel#>" ); }
			// UL start
			writeOutput('<ul id="recentEntries">');
			// iterate and create
			for(var x=1; x lte arguments.max; x++){
				writeOutput('<li class="recentEntries"><a href="#cb.linkEntry(entryResults.content[ x ])#">');
				writeOutput('<h5>#entryResults.content[ x ].getTitle()#</h5>');
				writeOutput('<span>#dateFormat(entryResults.content[ x ].getDisplayPublishedDate(),'mmm dd, yyyy' )#</span>');
				writeOutput('</a></li>');
			}
			// close ul
			writeOutput( "</ul>" );
		}

		return rString;
	}

	/**
	* Get all the categories
	*/
	array function getAllCategories() cbIgnore{
		return variables.categoryService.getAllNames();
	}

}
