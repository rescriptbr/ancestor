export * from './Preview'

export const cleanUpCode = (code = '') =>
  code
  .replace(/className="(placeholder|teste)"\s/g, '')
