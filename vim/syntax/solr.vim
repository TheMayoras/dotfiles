" Syntax Highlighting for Solr queries
" By Ben Mayoras

if exists('b:current_syntax')
        finish
end

" Keyword
" Identifier
" String

" The keywords
syntax keyword solrKeyword AND OR NOT 
syntax match   solrKeyword '[+-]'

syntax match solrAll '[*]\(:[*]\)\?'

" A field to be searched
syntax match solrField '[a-zA-Z0-9_]\+' nextgroup=solrColon

" A colon
syntax match solrColon '[:]' nextgroup=solrQuery,solrString

" syntax region solrQuery start="(" skip=+".*[()].*"+ end=")" contained
" syntax match solrQuery '\(\S+\|[*]\)'
syntax region solrQuery matchgroup=solrQuote start=~"~ skip=~\\"~ end=~"~ contained oneline
syntax match solrQuery  ~[a-zA-Z0-9]\+~ contained
syntax match solrQuery  ~*~ contained
syntax region solrQuery start=~(~ end=~)~ contains=solrQuery,solrKeyword contained transparent

hi def link solrKeyword keyword
hi def link solrAll     keyword
hi def link solrField   identifier
hi def link solrColon   keyword
hi def link solrQuery   string
hi def link solrString  string
hi def link solrQuote   operator
