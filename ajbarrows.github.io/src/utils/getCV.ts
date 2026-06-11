import { readFileSync } from "fs";
import { resolve } from "path";
import yaml from "js-yaml";

export interface EducationEntry {
  degree: string;
  institution: string;
  institution_url?: string;
  location?: string;
  period: string;
  thesis?: string;
}

export interface ExperienceEntry {
  position: string;
  organization: string;
  organization_url?: string;
  period: string;
  group?: string;
  description?: string;
}

export function getEducation(): EducationEntry[] {
  const raw = readFileSync(resolve(process.cwd(), "../education.yaml"), "utf-8");
  return yaml.load(raw) as EducationEntry[];
}

export function getExperience(): ExperienceEntry[] {
  const raw = readFileSync(resolve(process.cwd(), "../experience.yaml"), "utf-8");
  return yaml.load(raw) as ExperienceEntry[];
}
