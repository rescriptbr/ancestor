type testable<'a>
type jestFn

@val @scope("jest") external fn0: (unit => 'a) => jestFn = "fn"
@val @scope("jest") external fn1: ('a => 'b) => jestFn = "fn"
@val @scope("jest") external fn2: (('a, 'b) => 'c, 'a, 'b) => 'c = "fn"

// Methods
@val external describe: (string, (. unit) => unit) => unit = "describe"
@val external it: (string, (. unit) => unit) => unit = "it"
@val external test: (string, (. unit) => unit) => unit = "test"

// Expect
@val external expect: 'value => testable<'value> = "expect"
@val external expectFn: jestFn => testable<'value> = "expect"
@val external expectArray: array<'value> => testable<'value> = "expect"

@send external toBe: (testable<'value>, 'value) => unit = "toBe"
@send external toEqual: (testable<'value>, 'value) => testable<'value> = "toEqual"
@send external toContain: (testable<'value>, 'value) => testable<'value> = "toContain"
@send external toHaveBeenCalled: (testable<'value>, unit) => testable<'value> = "toHaveBeenCalled"
@send
external toHaveBeenCalledTimes: (testable<'value>, int) => testable<'value> =
  "toHaveBeenCalledTimes"
// .resolves
// .rejects
// .toHaveBeenCalled()
// .toHaveBeenCalledTimes(number)
// .toHaveBeenCalledWith(arg1, arg2, ...)
// .toHaveBeenLastCalledWith(arg1, arg2, ...)
// .toHaveBeenNthCalledWith(nthCall, arg1, arg2, ....)
// .toHaveReturned()
// .toHaveReturnedTimes(number)
// .toHaveReturnedWith(value)
// .toHaveLastReturnedWith(value)
// .toHaveNthReturnedWith(nthCall, value)
// .toHaveLength(number)
// .toHaveProperty(keyPath, value?)
// .toBeCloseTo(number, numDigits?)
// .toBeDefined()
// .toBeFalsy()
// .toBeGreaterThan(number | bigint)
// .toBeGreaterThanOrEqual(number | bigint)
// .toBeLessThan(number | bigint)
// .toBeLessThanOrEqual(number | bigint)
// .toBeInstanceOf(Class)
// .toBeNull()
// .toBeTruthy()
// .toBeUndefined()
// .toBeNaN()
// .toContain(item)
// .toContainEqual(item)
// .toMatch(regexp | string)
// .toMatchObject(object)
// .toMatchSnapshot(propertyMatchers?, hint?)
// .toMatchInlineSnapshot(propertyMatchers?, inlineSnapshot)
// .toStrictEqual(value)
// .toThrow(error?)
// .toThrowErrorMatchingSnapshot(hint?)
// .toThrowErrorMatchingInlineSnapshot(inlineSnapshot)

@get external not: testable<'value> => testable<'value> = "not"
