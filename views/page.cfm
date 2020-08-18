<cfoutput>
<!--- View Arguments --->
<cfparam name="args.print" 		default="false">
<cfparam name="args.sidebar" 	default="true">

<!-- Banner Starts Here -->
<div class="heading-page header-text" id="body-header">
  <section class="page-heading overlay-dark">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="text-content">
            <h4>#prc.page.getTitle()#</h4>
            <cfif prc.page.getExcerpt() NEQ "">
            	<h2>#prc.page.getExcerpt()#</h2>
            </cfif>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
<!-- Banner Ends Here -->

<!--- ContentBoxEvent --->
#cb.event( "cbui_prePageDisplay" )#

<!--- Body Main --->
<section class="main-banner margin-top100 #listfirst(cb.getCurrentPage().getSlug(),'/')#" id="body-main">
	<div class="container">
		#prc.page.renderContent()#
	</div>
</section>

<!--- ContentBoxEvent --->
#cb.event("cbui_postPageDisplay")#
</cfoutput>