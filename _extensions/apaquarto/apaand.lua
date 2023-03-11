function Cite(elem)
    if elem.citations[1].mode == "AuthorInText" then
        elem.content = pandoc.walk_inline(elem, {
            Str = function(el)
                return pandoc.Str(string.gsub(el.text, "&", "and"))
            end})
        return elem.content
    end
    return pandoc.Cite(elem.content, elem.citations, elem.tag)
end