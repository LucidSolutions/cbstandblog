<cfoutput>
<footer id="footer">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<ul class="social-icons">
					<li><a target="_blank" href="#cb.themeSetting( 'facebookUrl' )#">Facebook</a></li>
					<li><a target="_blank" href="#cb.themeSetting( 'twitterUrl' )#">Twitter</a></li>
					<li><a target="_blank" href="#cb.themeSetting( 'behanceUrl' )#">Behance</a></li>
					<li><a target="_blank" href="#cb.themeSetting( 'linkedinUrl' )#">Linkedin</a></li>
					<li><a target="_blank" href="#cb.themeSetting( 'dribbbleUrl' )#">Dribbble</a></li>
				</ul>
			</div>
			<div class="col-lg-12">
				<div class="copyright-text">
					<p>Copyright #YEAR(NOW())# #cb.siteName()# Co.</p>
				</div>
			</div>
		</div>
		<!--- contentboxEvent --->
		#cb.event( "cbui_footer" )#
	</div>
</footer>
</cfoutput>