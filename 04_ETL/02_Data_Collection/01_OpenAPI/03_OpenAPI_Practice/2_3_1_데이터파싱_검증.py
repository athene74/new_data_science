response={
	"response":{
		"header":{"resultCode":"00","resultMsg":"NORMAL_SERVICE"},
		"body":{
			"dataType":"JSON",
			"items":{
				"item":[
				{"baseDate":"20240730","baseTime":"1200","category":"PTY","nx":55,"ny":127,"obsrValue":"0"},
				{"baseDate":"20240730","baseTime":"1200","category":"REH","nx":55,"ny":127,"obsrValue":"78"},
				{"baseDate":"20240730","baseTime":"1200","category":"RN1","nx":55,"ny":127,"obsrValue":"0"},
				{"baseDate":"20240730","baseTime":"1200","category":"T1H","nx":55,"ny":127,"obsrValue":"29.3"},
				{"baseDate":"20240730","baseTime":"1200","category":"UUU","nx":55,"ny":127,"obsrValue":"0.5"},
				{"baseDate":"20240730","baseTime":"1200","category":"VEC","nx":55,"ny":127,"obsrValue":"187"},
				{"baseDate":"20240730","baseTime":"1200","category":"VVV","nx":55,"ny":127,"obsrValue":"4"},
				{"baseDate":"20240730","baseTime":"1200","category":"WSD","nx":55,"ny":127,"obsrValue":"4"}
				]
			},
			"pageNo":1,
			"numOfRows":10,
			"totalCount":8
		}
	}
}


print(type(response))
# print(response['response'])
print(response['response']['body']['items']['item'])