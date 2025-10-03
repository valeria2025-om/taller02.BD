
SELECT COUNT(DISTINCT cc.IdCancion) AS TotalCanciones
FROM Compositor c
JOIN Cancion_Compositor cc ON c.Id = cc.IdCompositor
WHERE CHARINDEX('JUANES', c.Nombre) > 0;

SELECT intr.Nombre AS Interprete, r.Ritmo
FROM Cancion c
JOIN Interpretacion i ON c.Id = i.IdCancion
JOIN Ritmo r ON i.IdRitmo = r.Id
JOIN Interprete intr ON i.IdInterprete = intr.Id
WHERE c.Titulo = 'Lluvia';

SELECT DISTINCT c.Titulo
FROM Cancion c
JOIN Cancion_Compositor cc ON c.Id = cc.IdCancion
JOIN Compositor comp ON cc.IdCompositor = comp.Id
JOIN Interpretacion i ON c.Id = i.IdCancion
JOIN Interprete intr ON i.IdInterprete = intr.Id
JOIN Ritmo r ON i.IdRitmo = r.Id
JOIN Tipo t ON intr.IdTipoInterprete = t.Id
WHERE r.Ritmo = 'Balada'
  AND t.Tipo = 'Solista'
  AND CHARINDEX(intr.Nombre, comp.Nombre) > 0;

  SELECT DISTINCT p.Nombre
FROM Interprete intr
JOIN Tipo t ON intr.IdTipoInterprete = t.Id
JOIN Pais p ON intr.IdPais = p.Id
JOIN Interpretacion i ON intr.Id = i.IdInterprete
JOIN Ritmo r ON i.IdRitmo = r.Id
WHERE r.Ritmo = 'Salsa' AND t.Tipo = 'Grupo';

SELECT c.Titulo, intr.Nombre AS Interprete
FROM Cancion c
JOIN Interpretacion i ON c.Id = i.IdCancion
JOIN Interprete intr ON i.IdInterprete = intr.Id
WHERE c.Titulo IN ('Candilejas', 'Malaguena');

SELECT intr.Nombre AS Artista,
       COUNT(DISTINCT cc.IdCancion) AS CancionesCompuestas,
       COUNT(DISTINCT i.IdCancion) AS CancionesInterpretadas
FROM Interprete intr
JOIN Compositor comp ON intr.Nombre = comp.Nombre
                     OR CHARINDEX(intr.Nombre, comp.Nombre) > 0
JOIN Cancion_Compositor cc ON comp.Id = cc.IdCompositor
JOIN Interpretacion i ON intr.Id = i.IdInterprete
GROUP BY intr.Nombre
HAVING COUNT(DISTINCT cc.IdCancion) > 0 
   AND COUNT(DISTINCT i.IdCancion) > 0;




