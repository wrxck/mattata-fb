HTTPS = require('ssl.https')
JSON = require('dkjson')
ltn12 = require('ltn12')
multipart = require('multipart-post')
method = 'subscribed_apps'
accessToken = 'EAAJIdUdflegBAEuTMsbwEe29xPwp3rm5XWWgkKYcCWZCJJy0q7OsGgU7zKGqHZBUFOIcoZCPBcItLMXHUsJZCHEUCA8inFbR9hX1m5ZCUCInWujCvVbJOKidZAsuE1dvZAbXcgCwr6neenFsLShELOi7SUaR5gzTP6d8HkjxmmXBwZDZD'
parameters = {}
for k, v in pairs(parameters) do
	parameters[k] = tostring(v)
end
if next(parameters) == nil then
	parameters = { '' }
end
response = {}
body, boundary = multipart.encode(parameters)
success, res = HTTPS.request{
	url = 'https://graph.facebook.com/v2.6/me' .. '/' .. method .. '?access_token=' .. accessToken,
	method = 'POST',
	headers = {
		['Content-Type'] = 'application/json'
	},
	source = ltn12.source.string(body),
	sink = ltn12.sink.table(response)
}
data = table.concat(response)
