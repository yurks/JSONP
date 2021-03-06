
describe 'JSONP: Openweathermap.org API request', ->

    it 'should create a remote request to an API', (done) ->

        value = 'fail'

        JSONP
            url: 'http://api.openweathermap.org/data/2.5/weather'
            data: q: 'London,UK'
            success: (data) ->
                if typeof data is 'object'
                    value = 'success'
                    expect(value).to.equal('success')
                done()
            error: (data) ->
                expect(value).to.equal('success')
                done()


describe 'JSONP: Forced failure', ->

    it 'should force a failure of a remote request', (done) ->

        value = 'fail'

        JSONP
            url: 'http://j3lk5f0dl3m0f3lt0fdlem30gugmtu5p5mgmdu34lflfm30fulddu93ldfu3ldfg2ufogk234-fu23nf3/'
            data: q: 'London,UK'
            success: (data) ->
                expect(value).to.equal('success')
                done()
            error: (data) ->
                value = 'success'
                expect(value).to.equal('success')
                done()

describe 'JSONP: Missing url parameter', ->

    it 'should fail because of missing url parameter', (done) ->

        flag = false
        value = 'fail'

        try
            JSONP()
        catch e
            if e.message is 'MissingUrl'
                flag = true
                value = 'success'
            else
                flag = true
                throw e

        expect(value).to.equal('success')
        done()

