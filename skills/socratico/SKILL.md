---
name: socratico
description: Analiza tareas con el método socrático antes de ejecutarlas. Genera 3 preguntas (teórica, framework, aplicación) para entender profundamente el problema antes de implementar. Activa con "socrático:" seguido de la instrucción.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - AskUserQuestion
---

# Skill: Socrático

Analiza tareas con el método socrático antes de ejecutarlas. Genera reflexión estructurada para entender el problema antes de implementar.

---

## Trigger

Este skill se activa cuando el usuario escribe `socrático:` seguido de una instrucción.

Ejemplos de activación:
- `socrático: crea un script que sincronice archivos`
- `socrático: implementa autenticación con JWT`
- `socrático: refactoriza este componente para usar hooks`

---

## Proceso

### PASO 1: Extraer la Instrucción

Identifica claramente la instrucción/idea/problema del mensaje del usuario.

Formato de extracción:
```
**Instrucción extraída:** [descripción clara y concisa de lo que se pide]
```

---

### PASO 2: Generar 3 Preguntas Socráticas

Transforma la tarea en 3 preguntas que profundicen el entendimiento:

#### 1️⃣ TEÓRICA
> ¿Qué hace que [tipo de output solicitado] sea efectivo?

Responde con criterios concretos de calidad y efectividad. Lista 4-6 características que definen una buena implementación.

#### 2️⃣ FRAMEWORK
> ¿Qué principios, patrones o mejores prácticas aplican a este tipo de problema?

Identifica:
- Patrones de diseño relevantes
- Herramientas/librerías gold standard
- Principios de ingeniería que aplican
- Trade-offs comunes

#### 3️⃣ APLICACIÓN
> Aplica esos insights a [la tarea específica del usuario]

Genera un plan concreto que incorpore los insights de las preguntas anteriores. Incluye:
- Enfoque recomendado
- Código de ejemplo o pseudocódigo
- Consideraciones específicas del contexto

---

### PASO 3: Presentar el Análisis

Mostrar las 3 secciones con respuestas concretas.

**IMPORTANTE:** NO ejecutes la tarea todavía. Solo presenta el análisis.

Formato de presentación:

```markdown
## 🧠 Socrático: [Título descriptivo]

**Instrucción extraída:** [lo que se pide]

---

### 1️⃣ TEÓRICA: ¿Qué hace que [X] sea efectivo?

- [criterio 1]
- [criterio 2]
- [criterio 3]
- [criterio 4]

---

### 2️⃣ FRAMEWORK: ¿Qué principios aplican?

- **[Patrón/Herramienta 1]**: [descripción breve]
- **[Patrón/Herramienta 2]**: [descripción breve]
- **[Principio]**: [por qué aplica]

---

### 3️⃣ APLICACIÓN: Plan concreto

[Código o pseudocódigo]

Con consideraciones:
- [consideración 1]
- [consideración 2]
```

---

### PASO 4: Confirmar Acción

Después de presentar el análisis, usa AskUserQuestion para confirmar:

```json
{
  "questions": [{
    "question": "¿Cómo quieres proceder?",
    "header": "Acción",
    "options": [
      {"label": "Ejecutar", "description": "Procedo a implementar el plan"},
      {"label": "Copiar", "description": "Te doy el plan en formato copiable"},
      {"label": "Refinar", "description": "Ajustemos el enfoque antes de implementar"}
    ],
    "multiSelect": false
  }]
}
```

---

## Manejo de Respuestas

### Si elige "Ejecutar"
1. Implementa el plan presentado
2. Sigue los criterios de calidad identificados en la pregunta TEÓRICA
3. Aplica los patrones/principios del FRAMEWORK
4. Muestra el código final con comentarios donde sea necesario

### Si elige "Copiar"
Presenta el plan completo en un bloque de código markdown para fácil copia:

```markdown
## Plan: [Título]

### Objetivo
[Lo que se busca lograr]

### Enfoque
[Metodología a seguir]

### Implementación
[Código o pasos detallados]

### Consideraciones
- [punto 1]
- [punto 2]
```

### Si elige "Refinar"
Pregunta qué aspecto quiere ajustar:
- ¿El enfoque general?
- ¿Los criterios de calidad?
- ¿Los trade-offs?
- ¿El nivel de complejidad?

---

## Ejemplo Completo

**Input:** `socrático: crea un script que sincronice archivos entre dos carpetas`

**Output:**

---

## 🧠 Socrático: Script de sincronización

**Instrucción extraída:** Crear script para sincronizar archivos entre dos carpetas.

---

### 1️⃣ TEÓRICA: ¿Qué hace que un script de sync sea efectivo?

- Detecta cambios incrementales (no copia todo cada vez)
- Maneja conflictos (mismo archivo modificado en ambos lados)
- Es idempotente (correrlo múltiples veces = mismo resultado)
- Tiene dry-run para preview
- Logging claro de qué cambió

---

### 2️⃣ FRAMEWORK: ¿Qué principios aplican?

- **rsync**: gold standard para delta sync con checksums
- **Watchdog pattern**: para cambios en tiempo real
- **Three-way merge**: para resolver conflictos
- **Atomic operations**: para evitar corrupción

---

### 3️⃣ APLICACIÓN: Plan concreto

```bash
#!/bin/bash
rsync -avz --delete --dry-run "$SOURCE" "$DEST"
```

Con opciones:
- `-a`: archive mode (preserva permisos, timestamps)
- `-v`: verbose
- `-z`: compresión
- `--delete`: elimina archivos en destino que no existen en origen
- `--dry-run`: preview sin cambios

---

**¿Cómo quieres proceder?**
[Ejecutar] [Copiar] [Refinar]

---

## Notas de Implementación

1. **Siempre extraer la instrucción primero** — clarifica el objetivo
2. **Las 3 preguntas son obligatorias** — no saltar ninguna
3. **Respuestas concretas, no genéricas** — criterios y patrones específicos
4. **NO ejecutar sin confirmación** — el método socrático requiere reflexión
5. **Adaptar la profundidad** — tareas simples = análisis más breve
