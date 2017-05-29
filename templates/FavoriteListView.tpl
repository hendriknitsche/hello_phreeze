{extends file="Master.tpl"}

{block name=title}Hello Phreeze | Favorites{/block}

{block name=customHeader}
<script type="text/javascript">
	$LAB.script("scripts/app/favorites.js").wait(function(){
		$(document).ready(function(){
			page.init();
		});

		// hack for IE9 which may respond inconsistently with document.ready
		setTimeout(function(){
			if (!page.isInitialized) page.init();
		},1000);
	});
</script>
{/block}

{block name=banner}
	<h1>
		<i class="icon-th-list"></i> Favorites
		<span id=loader class="loader progress progress-striped active"><span class="bar"></span></span>
		<span class='input-append pull-right searchContainer'>
			<input id='filter' type="text" placeholder="Search..." />
			<button class='btn add-on'><i class="icon-search"></i></button>
		</span>
	</h1>
{/block}

{block name=navbar prepend}
	{assign var="nav" value="favorites"}
{/block}

{block name=content}

	<!-- underscore template for the collection -->
	<script type="text/template" id="favoriteCollectionTemplate">
		<table class="collection table table-bordered table-hover">
		<thead>
			<tr>
				<th id="header_Id">Id<% if (page.orderBy == 'Id') { %> <i class='icon-arrow-<%= page.orderDesc ? 'up' : 'down' %>' /><% } %></th>
				<th id="header_PurchaseId">Purchase Id<% if (page.orderBy == 'PurchaseId') { %> <i class='icon-arrow-<%= page.orderDesc ? 'up' : 'down' %>' /><% } %></th>
				<th id="header_Note">Note<% if (page.orderBy == 'Note') { %> <i class='icon-arrow-<%= page.orderDesc ? 'up' : 'down' %>' /><% } %></th>
			</tr>
		</thead>
		<tbody>
		<% items.each(function(item) { %>
			<tr id="<%= _.escape(item.get('id')) %>">
				<td><%= _.escape(item.get('id') || '') %></td>
				<td><%= _.escape(item.get('purchaseId') || '') %></td>
				<td><%= _.escape(item.get('note') || '') %></td>
			</tr>
		<% }); %>
		</tbody>
		</table>

		<%=  view.getPaginationHtml(page) %>
	</script>

	<!-- underscore template for the model -->
	<script type="text/template" id="favoriteModelTemplate">
		<form class="form-horizontal" onsubmit="return false;">
			<fieldset>
				<div id="idInputContainer" class="control-group">
					<label class="control-label" for="id">Id</label>
					<div class="controls inline-inputs">
						<span class="input-xlarge uneditable-input" id="id"><%= _.escape(item.get('id') || '') %></span>
						<span class="help-inline"></span>
					</div>
				</div>
				<div id="purchaseIdInputContainer" class="control-group">
					<label class="control-label" for="purchaseId">Purchase Id</label>
					<div class="controls inline-inputs">
						<select id="purchaseId" name="purchaseId"></select>
						<span class="help-inline"></span>
					</div>
				</div>
				<div id="noteInputContainer" class="control-group">
					<label class="control-label" for="note">Note</label>
					<div class="controls inline-inputs">
						<input type="text" class="input-xlarge" id="note" placeholder="Note" value="<%= _.escape(item.get('note') || '') %>" />
						<span class="help-inline"></span>
					</div>
				</div>
			</fieldset>
		</form>

		<!-- delete button is is a separate form to prevent enter key from triggering a delete -->
		<form id="deleteFavoriteButtonContainer" class="form-horizontal" onsubmit="return false;">
			<fieldset>
				<div class="control-group">
					<label class="control-label"></label>
					<div class="controls">
						<button id="deleteFavoriteButton" class="btn btn-mini btn-danger"><i class="icon-trash icon-white"></i> Delete Favorite</button>
						<span id="confirmDeleteFavoriteContainer" class="hide">
							<button id="cancelDeleteFavoriteButton" class="btn btn-mini">Cancel</button>
							<button id="confirmDeleteFavoriteButton" class="btn btn-mini btn-danger">Confirm</button>
						</span>
					</div>
				</div>
			</fieldset>
		</form>
	</script>

	<!-- modal edit dialog -->
	<div class="modal hide fade" id="favoriteDetailDialog">
		<div class="modal-header">
			<a class="close" data-dismiss="modal">&times;</a>
			<h3>
				<i class="icon-edit"></i> Edit Favorite
				<span id="modelLoader" class="loader progress progress-striped active"><span class="bar"></span></span>
			</h3>
		</div>
		<div class="modal-body">
			<div id="modelAlert"></div>
			<div id="favoriteModelContainer"></div>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" >Cancel</button>
			<button id="saveFavoriteButton" class="btn btn-primary">Save Changes</button>
		</div>
	</div>

	<div id="collectionAlert"></div>
	
	<div id="favoriteCollectionContainer" class="collectionContainer">
	</div>

	<p id="newButtonContainer" class="buttonContainer">
		<button id="newFavoriteButton" class="btn btn-primary">Add Favorite</button>
	</p>

{/block}
