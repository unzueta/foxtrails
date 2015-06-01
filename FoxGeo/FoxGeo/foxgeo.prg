LOCAL lcMapJs, lcSafety
SET STEP ON
DO batch_geo.prg

USE offices.dbf
lcMapJs = RenderVml("map.js.vml",null)

lcSafety = SET("Safety")
SET SAFETY OFF
STRTOFILE(lcMapJs,"map.js")
SET SAFETY &lcSafety

DO FORM FoxGeo
