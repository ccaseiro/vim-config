local Color, c, Group, g, s = require('colorbuddy').setup()

Color.new('cs1', '#C191FF')
Color.new('cs2', '#6C95EB')
Color.new('cs3', '#66C3CC')
Color.new('cs4', '#BDBDBD')
Color.new('cs5', '#C9A26D')
Color.new('cs6', '#39CC8F')
Color.new('cs7', '#FFFFFF')
Color.new('cs8', '#E1BFFF')

Group.new('Keyword',        c.cs2, nil, nil)
Group.new('NamespaceName',  c.cs1, nil, nil)
Group.new('ClassName',      c.cs1, nil, nil)
Group.new('PropertyName',   c.cs3, nil, nil)
Group.new('ParameterName',  c.cs4, nil, nil)
Group.new('StringLiteral',  c.cs5, nil, nil)
-- Group.new('LocalName',      c.cs4, nil, s.underline)
Group.new('LocalName',      c.cs7, nil, nil)
Group.new('MethodName',     c.cs6, nil, nil)
Group.new('EnumName',       c.cs8, nil, nil)
Group.new('Identifier',     c.cs3, nil, nil)
Group.new('StructName',     c.cs8, nil, nil)

-- print(vim.inspect(c))

vim.g.OmniSharp_highlight_groups = {
  Keyword = 'Keyword',
  NamespaceName = 'NamespaceName',
  ClassName = 'ClassName',
  PropertyName = 'PropertyName',
  ParameterName = 'ParameterName',
  StringLiteral = 'StringLiteral',
  LocalName = 'LocalName',
  MethodName = 'MethodName',
  ExtensionMethodName = 'MethodName',
  EnumName = 'EnumName',
  EnumMemberName = 'Identifier',
  StructName = 'StructName',
}
