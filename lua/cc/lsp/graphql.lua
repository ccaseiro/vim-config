-- graphql:
-- npm install -g graphql-language-service-cli
require 'cc.utils'.define_augroups({
    _graphql = {
        {'bufnewfile,bufread', '*.graphql', 'setfiletype graphql'}
    }
})
require'lspconfig'.graphql.setup{}


