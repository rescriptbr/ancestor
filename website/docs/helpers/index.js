export * from './Preview'

export const cleanUpCode = (code = '') => {
  const [_, cleanCode]= code.split('hidden-end')

  return cleanCode
    .replace(/className="(placeholder|teste)"\s/g, '')
}
