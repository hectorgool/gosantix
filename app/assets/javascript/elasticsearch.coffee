
class Elastisearch
	@searchTerm: ->
		{
			query: term: 'name.autocomplete': $('#term').val()
			facets: name: terms: field: 'name'
		}

Elastisearch.searchTerm()