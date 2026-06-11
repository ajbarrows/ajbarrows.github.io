import { readFileSync } from "fs";
import { resolve } from "path";
import yaml from "js-yaml";

interface YamlAuthor {
  first: string;
  last: string;
}

interface YamlPublication {
  key: string;
  type: string;
  category: string;
  title: string;
  authors: YamlAuthor[];
  year: number;
  month?: number;
  journal?: string;
  volume?: string;
  number?: string;
  pages?: string;
  doi?: string;
  image?: string;
  featured?: boolean;
}

export interface Publication {
  title: string;
  authors: string;
  citation: string;
  href: string;
  image: string;
}

function formatAuthors(authors: YamlAuthor[]): string {
  return authors
    .map(({ first, last }) => `${last} ${first[0]}`)
    .join(", ");
}

function formatCitation(pub: YamlPublication): string {
  const parts = [pub.journal ?? ""];
  if (pub.volume) {
    parts.push(pub.number ? `${pub.volume}(${pub.number})` : pub.volume);
  }
  parts.push(String(pub.year));
  return parts.filter(Boolean).join(", ");
}

export function getPeerReviewedPapers(): Publication[] {
  const filePath = resolve(process.cwd(), "../publications.yaml");
  const raw = readFileSync(filePath, "utf-8");
  const all = yaml.load(raw) as YamlPublication[];

  return all
    .filter((p) => p.type === "article" && p.category === "peer-reviewed")
    .sort((a, b) => b.year - a.year || (b.month ?? 0) - (a.month ?? 0))
    .map((p) => ({
      title: p.title,
      authors: formatAuthors(p.authors),
      citation: formatCitation(p),
      href: p.doi ? `https://doi.org/${p.doi}` : "",
      image: p.image ?? "",
    }));
}
