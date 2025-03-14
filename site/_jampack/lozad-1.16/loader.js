import lozad from "./lozad.es.js";
      const observer = lozad('.jampack-lozad', { rootMargin: '100px 0px', threshold: [0.1] });
      observer.observe();