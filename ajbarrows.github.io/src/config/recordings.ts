export interface Recording {
  title: string;
  href: string; // link to the video or recording (YouTube, Bandcamp, Spotify, etc.)
  date?: string; // ISO format: YYYY-MM-DD
  platform?: string; // shown as a label; inferred from the link if omitted
  description?: string;
}

export const recordings: Recording[] = [
  // Example entry — replace with real recordings
  // {
  //   title: "Vermont Jazz Ensemble — Live at Higher Ground",
  //   href: "https://www.youtube.com/watch?v=...",
  //   date: "2026-04-25",
  //   description: "50th anniversary show.",
  // },

  {
    title: "Vermont Jazz Ensemble - Just Friends for Life",
    href: "https://open.spotify.com/track/7pafj5C7bZZ4Ez9OO5tJ1n?si=EFw0_N-lQTqq7KMICdvvrQ",
    date: "2026-04-01",
    description: "50th anniversary recording -- Alto Saxophone, Clarinet, Flute"
  },
  {
    title: "Die Walküre Act 1 and The Ride of the Valkyries",
    href: "https://s3.amazonaws.com/lcatv-lqm/GMMF11042316.mp4",
    platform: "Video",
    date: "2023-11-04",
    description: "Green Mountain Mahler Festival Orchestra -- Bass Clarinet, Clarinet"
  }
];
